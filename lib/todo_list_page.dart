import 'package:flutter/material.dart';
import 'todo_add_page.dart';

// リスト一覧表示画面Widget
class TodoListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('リスト一覧'),
      ),
      body: ListView(
        children: [
          _buildCard('にんじん'),
          _buildCard('大根'),
          _buildCard('カボチャ'),
          _buildCard('春菊'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // "push"で新規画面に遷移
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              // 遷移先の画面としてリスト追加画面を指定
              return TodoAddPage();
            }),
          );
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
}
