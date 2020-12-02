import 'package:flutter/material.dart';
import 'posts.dart';
import 'Screens/Post_Detail.dart';

class CardData extends StatelessWidget {
  const CardData({
    Key key,
    @required this.posts,
  }) : super(key: key);

  final Posts posts;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, PostDetail.route,
            arguments: Posts(title: posts.title, content: posts.content));
      },
      borderRadius: BorderRadius.circular(5),
      splashColor: Colors.red,
      child: Card(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
        child: Padding(
          padding: const EdgeInsets.all(15),
          // Title
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(posts.title,
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
              Text(posts.content,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
            ],
          ),
          // Content
        ),
      ),
    );
  }
}
