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
        //取得中の返り値を指定
        if (!snapshot.hasData) {
          return Center(
            child: Text("Loading"),
          );
        }
        //データを取得できた場合の返り値を指定
        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> message =
                document.data()! as Map<String, dynamic>;
            return _buildCard(message['text']);
          }).toList(),
        );
      },
    );
  }
}
//
