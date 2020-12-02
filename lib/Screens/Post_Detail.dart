import 'package:flutter/material.dart';
import 'package:testing_project/posts.dart';

class PostDetail extends StatelessWidget {
  static String route = 'postDetail';

  @override
  Widget build(BuildContext context) {
    final Posts data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('${data.title}'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 7,
                  child: Text(
                    '${data.title}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                    flex: 0,
                    child: IconButton(
                      splashRadius: 20,
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete,
                        size: 20,
                        color: Colors.red,
                      ),
                    ))
              ],
            ),
            SizedBox(height: 10),
            Text('${data.content}'),
          ],
        ),
      ),
    );
  }
}
