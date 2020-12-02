import 'package:flutter/material.dart';
import '../posts.dart';
import '../CardData.dart';
import 'Add_Screen.dart';

class HomeScreen extends StatefulWidget {
  static String route = 'home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Posts> postsData = [
    // Posts(title: 'Hello World!', content: 'Testing!'),
    // Posts(title: 'Hello World!', content: 'Testing!'),
    // Posts(title: 'Hello World!', content: 'Testing!'),
  ];
  // Map data = {};

  // void getDataAndUpdatePost() {
  //   // var data = Map<String, dynamic>.from(result);
  //   // String title = data['title'];
  //   // String content = data['content'];
  //   setState(() {
  //     postsData.add(Posts(title: data['title'], content: data['content']));
  //   });
  // }

  navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.pushNamed(context, AddScreen.route);
    if (result != null) {
      var data = Map<String, dynamic>.from(result);
      String title = data['title'];
      String content = data['content'];
      setState(() {
        postsData.add(Posts(title: title, content: content));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('My First App',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w300)),
                  Text('Created by Kean Vatharo.',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w300)),
                ],
              ),
              decoration: BoxDecoration(color: Colors.red),
            ),
            ListTile(
              title: Text('New Post'),
              onTap: () {
                navigateAndDisplaySelection(context);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateAndDisplaySelection(context);
        },
        backgroundColor: Colors.red,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('Blog Post'),
        centerTitle: true,
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: 50),
                  Text('Posts', style: TextStyle(fontSize: 20)),
                  SizedBox(width: 5),
                  ClipOval(
                    child: Container(
                      color: Colors.red,
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Text('${postsData.length}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          )),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: postsData
                    .map((e) => CardData(
                          posts: e,
                        ))
                    .toList(),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
