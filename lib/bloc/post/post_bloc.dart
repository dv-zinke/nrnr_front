import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:nrnr/models/Images.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';

import 'package:nrnr/bloc/post/post.dart';
import 'package:nrnr/models/Post.dart';


class PostBloc extends Bloc<PostEvent, PostState> {
  final http.Client httpClient;

  PostBloc({@required this.httpClient});

  @override
  Stream<PostState> transformEvents(
      Stream<PostEvent> events,
      Stream<PostState> Function(PostEvent event) next,
      ) {
    return super.transformEvents(
      events.debounceTime(
        Duration(milliseconds: 500),
      ),
      next,
    );
  }

  @override
  get initialState => PostUninitialized();

  @override
  Stream<PostState> mapEventToState(event) async* {
    final currentState = state;
    if (event is Fetch && !_hasReachedMax(currentState)) {
      try {
        if (currentState is PostUninitialized) {
          final posts = await _fetchPosts(0, 5);
          yield PostLoaded(posts: posts, hasReachedMax: false);
        }
        if (currentState is PostLoaded) {
          final posts = await _fetchPosts(currentState.posts.length, 20);
          yield posts.isEmpty
              ? currentState.copyWith(hasReachedMax: true)
              : PostLoaded(
              posts: currentState.posts + posts, hasReachedMax: false);
        }
      } catch (_) {
        yield PostError();
      }
    }
  }

  bool _hasReachedMax(PostState state) =>
      state is PostLoaded && state.hasReachedMax;

  Future<List<Post>> _fetchPosts(int startIndex, int limit) async {
    final response = await httpClient.get(
      'http://49.50.163.40:1337/nrnrs?_start=$startIndex&_limit=$limit&_sort=id:DESC');
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      return data.map((rawPost) {
        var tagObjsJson = rawPost['images'] as List;
        List _tags = tagObjsJson.map((tagJson) {
          return Images(id: tagJson['id'], url: tagJson['url'] );
        }).toList();
        return Post(
            id: rawPost['id'],
            title : rawPost['title'],
            city: rawPost['city'],
            address: rawPost['address'],
            deposit: rawPost['deposit'],
            phone: rawPost['phone'],
            text: rawPost['text'],
            start_at: rawPost['start_at'],
            end_at: rawPost['end_at'],
            home: rawPost['home'],
            period: rawPost['period'],
            rent_price: rawPost['rent_price'],
          images:_tags
        );
      }).toList();
    } else {
      throw Exception('error fetching posts');
    }
  }
}
