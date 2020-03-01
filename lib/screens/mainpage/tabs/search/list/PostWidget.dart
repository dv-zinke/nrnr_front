import 'package:flutter/material.dart';
import 'package:nrnr/models/Post.dart';

class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.network(post.url, fit: BoxFit.cover,),
          ListTile(
            trailing: Icon(Icons.more_vert),
            leading: ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: 44,
                  minHeight: 44,
                  maxWidth: 44,
                  maxHeight: 44
              ),
              child: Image.network(post.thumbnailUrl, fit: BoxFit.cover,),
            ),
            title: Text(post.title),
            isThreeLine: true,
            subtitle: Text(post.url),
            dense: true,
          ),
        ],
      )
    );
  }
}
