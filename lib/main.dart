import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  debugPaintSizeEnabled = false; // Set to true for visual layout
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const showCard = false; // Set to false to show Stack

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: Center(child: showCard ? _buildCard() : _buildStack()),
      ),
    );
  }

  // #docregion Card
  Widget _buildCard() {
    return SizedBox(
      height: 210,
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: const Text(
                '1625 Main Street',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: const Text('My City, CA 99984'),
              leading: Icon(
                Icons.restaurant_menu,
                color: Colors.blue[500],
              ),
            ),
            const Divider(),
            ListTile(
              title: const Text(
                '(408) 555-1212',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              leading: Icon(
                Icons.contact_phone,
                color: Colors.blue[500],
              ),
            ),
            ListTile(
              title: const Text('costa@example.com'),
              leading: Icon(
                Icons.contact_mail,
                color: Colors.blue[500],
              ),
            ),
          ],
        ),
      ),
    );
  }
  // #enddocregion Card

  // #docregion Stack
  Widget _buildStack() {
    return Stack(
      alignment: const Alignment(0.6, 0.6),
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage('lib/images/sample1.jpeg'),
          radius: 100,
        ),
        Container(
          decoration: const BoxDecoration(
            color: Colors.black45,
          ),
          child: const Text(
            'Mia B',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
// #enddocregion Stack
}
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

// void main() {
//   debugPaintSizeEnabled = false; // Set to true for visual layout
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   static const showGrid = true; // Set to false to show ListView

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter layout demo',
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Flutter layout demo'),
//         ),
//         body: Center(child: showGrid ? _buildGrid() : _buildList()),
//       ),
//     );
//   }

//   Widget _buildGrid() => GridView.extent(
//       maxCrossAxisExtent: 150,
//       padding: const EdgeInsets.all(4),
//       mainAxisSpacing: 4,
//       crossAxisSpacing: 4,
//       children: _buildGridTileList(30));

//   List<Container> _buildGridTileList(int count) => List.generate(
//       count, (i) => Container(child: Image.asset('images/pic$i.jpg')));

//   Widget _buildList() {
//     return ListView(
//       children: [
//         _tile('CineArts at the Empire', '85 W Portal Ave', Icons.theaters),
//         _tile('The Castro Theater', '429 Castro St', Icons.theaters),
//         _tile('Alamo Drafthouse Cinema', '2550 Mission St', Icons.theaters),
//         _tile('Roxie Theater', '3117 16th St', Icons.theaters),
//         _tile('United Artists Stonestown Twin', '501 Buckingham Way',
//             Icons.theaters),
//         _tile('AMC Metreon 16', '135 4th St #3000', Icons.theaters),
//         const Divider(),
//         _tile('K\'s Kitchen', '757 Monterey Blvd', Icons.restaurant),
//         _tile('Emmy\'s Restaurant', '1923 Ocean Ave', Icons.restaurant),
//         _tile('Chaiya Thai Restaurant', '272 Claremont Blvd', Icons.restaurant),
//         _tile('La Ciccia', '291 30th St', Icons.restaurant),
//       ],
//     );
//   }

//   ListTile _tile(String title, String subtitle, IconData icon) {
//     return ListTile(
//       title: Text(title,
//           style: const TextStyle(
//             fontWeight: FontWeight.w500,
//             fontSize: 20,
//           )),
//       subtitle: Text(subtitle),
//       leading: Icon(
//         icon,
//         color: Colors.blue[500],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

// void main() {
//   debugPaintSizeEnabled = false; // Set to true for visual layout
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter layout demo',
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Flutter layout demo'),
//         ),
//         body: Center(child: _buildImageColumn()),
//       ),
//     );
//   }

//   // #docregion column
//   Widget _buildImageColumn() {
//     return Container(
//       decoration: const BoxDecoration(
//         color: Colors.black26,
//       ),
//       child: Column(
//         children: [
//           _buildImageRow(1),
//           _buildImageRow(3),
//         ],
//       ),
//     );
//   }
//   // #enddocregion column

//   // #docregion row
//   Widget _buildDecoratedImage(int imageIndex) => Expanded(
//         child: Container(
//           decoration: BoxDecoration(
//             border: Border.all(width: 10, color: Colors.black38),
//             borderRadius: const BorderRadius.all(Radius.circular(8)),
//           ),
//           margin: const EdgeInsets.all(4),
//           child: Image.network('https://placeimg.com/300/300/animals'),
//         ),
//       );

//   Widget _buildImageRow(int imageIndex) => Row(
//         children: [
//           _buildDecoratedImage(imageIndex),
//           _buildDecoratedImage(imageIndex + 1),
//         ],
//       );
//   // #enddocregion row
// }

// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

// void main() {
//   debugPaintSizeEnabled = true; // Set to true for visual layout
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter layout demo',
//       home: buildHomePage('Strawberry Pavlova Recipe'),
//     );
//   }

//   Widget buildHomePage(String title) {
//     const titleText = Padding(
//       padding: EdgeInsets.all(20),
//       child: Text(
//         'Strawberry Pavlova',
//         style: TextStyle(
//           fontWeight: FontWeight.w800,
//           letterSpacing: 0.5,
//           fontSize: 30,
//         ),
//       ),
//     );

//     const subTitle = Text(
//       'Pavlova is a meringue-based dessert named after the Russian ballerina '
//       'Anna Pavlova. Pavlova features a crisp crust and soft, light inside, '
//       'topped with fruit and whipped cream.',
//       textAlign: TextAlign.center,
//       style: TextStyle(
//         fontFamily: 'Georgia',
//         fontSize: 25,
//       ),
//     );

//     // #docregion ratings, stars
//     var stars = Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Icon(Icons.star, color: Colors.green[500]),
//         Icon(Icons.star, color: Colors.green[500]),
//         Icon(Icons.star, color: Colors.green[500]),
//         const Icon(Icons.star, color: Colors.black),
//         const Icon(Icons.star, color: Colors.black),
//       ],
//     );
//     // #enddocregion stars

//     final ratings = Container(
//       padding: const EdgeInsets.all(20),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           stars,
//           const Text(
//             '170 Reviews',
//             style: TextStyle(
//               color: Colors.black,
//               fontWeight: FontWeight.w800,
//               fontFamily: 'Roboto',
//               letterSpacing: 0.5,
//               fontSize: 20,
//             ),
//           ),
//         ],
//       ),
//     );
//     // #enddocregion ratings

//     // #docregion iconList
//     const descTextStyle = TextStyle(
//       color: Colors.black,
//       fontWeight: FontWeight.w800,
//       fontFamily: 'Roboto',
//       letterSpacing: 0.5,
//       fontSize: 18,
//       height: 2,
//     );

//     // DefaultTextStyle.merge() allows you to create a default text
//     // style that is inherited by its child and all subsequent children.
//     final iconList = DefaultTextStyle.merge(
//       style: descTextStyle,
//       child: Container(
//         padding: const EdgeInsets.all(20),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Column(
//               children: [
//                 Icon(Icons.kitchen, color: Colors.green[500]),
//                 const Text('PREP:'),
//                 const Text('25 min'),
//               ],
//             ),
//             Column(
//               children: [
//                 Icon(Icons.timer, color: Colors.green[500]),
//                 const Text('COOK:'),
//                 const Text('1 hr'),
//               ],
//             ),
//             Column(
//               children: [
//                 Icon(Icons.restaurant, color: Colors.green[500]),
//                 const Text('FEEDS:'),
//                 const Text('4-6'),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//     // #enddocregion iconList

//     // #docregion leftColumn
//     final leftColumn = Container(
//       padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
//       child: Column(
//         children: [
//           titleText,
//           subTitle,
//           ratings,
//           iconList,
//         ],
//       ),
//     );
//     // #enddocregion leftColumn

//     final mainImage = Image.asset(
//       'lib/images/sample1.jpeg',
//       fit: BoxFit.cover,
//     );

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//       ),
//       // #docregion body
//       body: Center(
//         child: Container(
//           margin: const EdgeInsets.fromLTRB(0, 40, 0, 30),
//           height: 600,
//           child: Card(
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Expanded(
//                   child: leftColumn,
//                 ),
//                 // SizedBox(
//                 //   width: 440,
//                 //   child: leftColumn,
//                 // ),
//                 Expanded(
//                   child: mainImage,
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//       // #enddocregion body
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

// void main() {
//   debugPaintSizeEnabled = true; // Remove to suppress visual layout
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter layout demo',
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Flutter layout demo'),
//         ),
//         // Change to buildColumn() for the other column example
//         body: Center(child: buildRating()),
//       ),
//     );
//   }

//   Widget buildRow() =>
//       // #docregion Row
//       Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Expanded(
//             child: Image.asset('lib/images/sample2.jpeg'),
//           ),
//           Expanded(
//             child: Image.asset('lib/images/sample1.jpeg'),
//           ),
//           Expanded(
//             child: Image.asset('lib/images/sample3.jpeg'),
//           ),
//         ],
//       );
//   // #enddocregion Row

//   Widget buildColumn() =>
//       // #docregion Column
//       Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Expanded(
//             child: Image.asset('lib/images/sample2.jpeg'),
//           ),
//           Expanded(
//             child: Image.asset('lib/images/sample1.jpeg'),
//           ),
//           Expanded(
//             child: Image.asset('lib/images/sample3.jpeg'),
//           ),
//         ],
//       );
//   // #enddocregion Column

//   Widget buildRating() => Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(Icons.star, color: Colors.green[500]),
//           Icon(Icons.star, color: Colors.green[500]),
//           Icon(Icons.star, color: Colors.green[500]),
//           const Icon(Icons.star, color: Colors.black),
//           const Icon(Icons.star, color: Colors.black),
//         ],
//       );

//   var stars = Row(
//     mainAxisSize: MainAxisSize.min,
//     children: [
//       Icon(Icons.star, color: Colors.green[500]),
//       Icon(Icons.star, color: Colors.green[500]),
//       Icon(Icons.star, color: Colors.green[500]),
//       const Icon(Icons.star, color: Colors.black),
//       const Icon(Icons.star, color: Colors.black),
//     ],
//   );
// }

// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

// void main() {
//   debugPaintSizeEnabled = true;
//   runApp(const MyApp());
// }

// // class MyApp extends StatelessWidget {
// //   const MyApp({Key? key}) : super(key: key);

// //   // This widget is the root of your application.
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Flutter Demo',
// //       theme: ThemeData(
// //         // This is the theme of your application.
// //         //
// //         // Try running your application with "flutter run". You'll see the
// //         // application has a blue toolbar. Then, without quitting the app, try
// //         // changing the primarySwatch below to Colors.green and then invoke
// //         // "hot reload" (press "r" in the console where you ran "flutter run",
// //         // or simply save your changes to "hot reload" in a Flutter IDE).
// //         // Notice that the counter didn't reset back to zero; the application
// //         // is not restarted.
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: const MyHomePage(title: 'Flutter Demo Home Page'),
// //     );
// //   }
// // }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(color: Colors.white),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children:[
//           Expanded(
//             child: Image.asset('lib/images/sample2.jpeg'),
//           ),
//           Expanded(
//             child: Image.asset('lib/images/sample1.jpeg'),
//           ),
//           Expanded(
//             child: Image.asset('lib/images/sample3.jpeg'),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
