import 'package:flutter/material.dart';
// import '../posts.dart';
// import '../CardData.dart';

class AddScreen extends StatefulWidget {
  static String route = 'add';

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final textController = TextEditingController();
  final secTextController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Posts'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Add New Post', style: TextStyle(fontSize: 20)),
                  SizedBox(height: 10),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          TextField(
                              keyboardType: TextInputType.text,
                              controller: textController,
                              style: TextStyle(fontSize: 15),
                              decoration: InputDecoration(
                                  icon: Icon(Icons.text_fields),
                                  labelText: 'Title')),
                          TextField(
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              controller: secTextController,
                              style: TextStyle(fontSize: 15),
                              decoration: InputDecoration(
                                  icon: Icon(Icons.text_format),
                                  labelText: 'Content')),
                          SizedBox(height: 30),
                          FlatButton.icon(
                            color: Colors.red,
                            onPressed: () {
                              Navigator.pop(context, {
                                'title': textController.text,
                                'content': secTextController.text
                              });
                            },
                            icon: Icon(
                              Icons.add_circle,
                              color: Colors.white,
                            ),
                            label: Text('Add',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          )
        ],
      ),
    );
  }
}
