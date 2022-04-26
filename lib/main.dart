import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'todo_list_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'controller/auth_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(HomePage());
}

// class MyTodoApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Todo App',
//       theme: ThemeData(
//         // テーマカラー
//         primarySwatch: Colors.blue,
//       ),

//       // リストの表示
//       home: TodoListPage(),
//     );
//   }
// }
class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('local_auth'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            //生体認証を実行
            await ref.read(authControllerProvider).didAuthenticate();
          },
          child: const Text('生体認証'),
        ),
      ),
    );
  }
}
