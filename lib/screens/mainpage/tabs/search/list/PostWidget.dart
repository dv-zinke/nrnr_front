import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nrnr/models/Images.dart';
import 'package:nrnr/models/Post.dart';

class PostWidget extends StatelessWidget {
  final Post post;
  const PostWidget({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Card(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: ()=>{
              Navigator.pushNamed(context, '/detail', arguments: post)
            },
            child: Container(
                width: 400,
                height: 300,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5)
                  )

                ),
                child: Image.network(post.images[0].toString(), fit: BoxFit.cover,)),
          ),
          ListTile(
            onTap: ()=>{
              Navigator.pushNamed(context, '/detail', arguments: post)
            },
            trailing: Padding(
              padding: EdgeInsets.only(top:10),
              child: Text(post.start_at.substring(0,10)),
            ),
            leading: ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: 44,
                  minHeight: 44,
                  maxWidth: 60,
                  maxHeight: 44
              ),
              child: Padding(
                padding: EdgeInsets.only(top:10),
                child: Text("기간 ${post.period}달", style: TextStyle(fontSize: 13, color:  const Color(0xff6e6e6e)),),
              ),
            ),
            title: Center(child: Text(post.title, style: TextStyle(fontSize: 15, fontWeight:FontWeight.w900),)),
            isThreeLine: false,
            subtitle: Center(child: Text("${post.deposit} / ${post.rent_price} ")),
            dense: true,
          ),
        ],
      )
    );
  }
}
