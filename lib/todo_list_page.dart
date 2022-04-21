import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'todo_add_page.dart';

class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  List<String> todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('リスト一覧'),
      ),
      body: _buildList(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // "push"で新規画面に遷移
          // リスト追加画面の値を取得
          final newListText = await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              // 遷移先の画面としてリスト追加画面を指定
              return TodoAddPage();
            }),
          );

          if (newListText != null) {
            setState(() {
              todoList.add(newListText);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Card _buildCard(String title) {
    return Card(
      child: ListTile(title: Text(title)),
    );
  }

  Widget _buildList(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('todos').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        //データを取得できなかった場合の返り値を指定
        if (snapshot.hasError) {
          return Center(
            child: Text('取得できませんでした'),
          );
        }
        //取得中の返り値を指定Text(message['text'])
        if (!snapshot.hasData) {
          return Center(
            child: Text("Loading"),
          );
        }
        //データを取得できた場合の返り値を指定
        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> todo =
                document.data()! as Map<String, dynamic>;
            Key docId = Key(document.id);
            return Dismissible(
                key: docId,
                direction: DismissDirection.endToStart,
                background: Container(
                  alignment: AlignmentDirectional.centerEnd,
                  color: Colors.red,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                ),
                onDismissed: (direction) async {
                  FirebaseFirestore.instance
                      .collection('todos')
                      .doc(document.id)
                      .delete()
                      .then((value) =>
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.red,
                            content: Row(children: [
                              Icon(Icons.delete, color: Colors.white),
                              SizedBox(width: 20),
                              Expanded(child: Text('削除したでぇ'))
                            ]),
                          )));
                },
                child: _buildCard(todo['text']));
          }).toList(),
        );
      },
    );
  }
}
//
