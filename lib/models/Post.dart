import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;


  const Post({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  @override
  List<Object> get props => [albumId, id, title, url, thumbnailUrl];

  @override
  String toString() => 'Post { id: $id }';
}
