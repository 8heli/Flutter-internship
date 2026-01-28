// HomeScreen displays a list of items using dynamic data

import 'package:flutter/material.dart';
import '../widgets/customcard.dart';
import 'secondscreen.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key}); //what is super key? => super.key passes the key to the parent (StatelessWidget)


  //Sample dynamic data
  final List<Map<String, String>> items = const [
    {
      'title' : 'Flutter',
      'image': 'assets/imgs/flutter_img.jpg',// path of image
      'description': '''Flutter is an open-source UI toolkit created by Google for building natively compiled applications for mobile, web, and desktop from a single codebase. It uses Dart as its programming language and provides a rich set of customizable widgets, fast hot reload, and high-performance rendering. Flutter allows developers to create beautiful, responsive, and cross-platform apps efficiently.''', // triple quotes for longer strings
    },
    {
      'title': 'Dart',
      'image': 'assets/imgs/dart_img.jpg',
      'description': '''Dart is a modern, object-oriented programming language developed by Google. It is optimized for building user interfaces with Flutter,offering strong typing, null safety, and both Just-In-Time (JIT) and Ahead-Of-Time (AOT) compilation. Dart enables fast development, predictable performance, and cross-platform applicationswith a clean and easy-to-learn syntax.''',
    },
    {
      'title': 'App Development',
      'image': 'assets/imgs/flutter_dart_img.jpg',
      'description':'''Apps are created using Dart as the programming language and Flutter as the UI framework. Developers write Dart code to design user interfaces using widgets, manage application logic, and handle user interactions such as navigation, input, and state changes. Flutter compiles this code into fast, natively optimized applications that can run on Android,iOS, web, and desktop platforms from a single codebase. This approach allows developers to build visually rich, high-performance, and cross-platform applications efficiently and consistently.'''

    },

  ];
  @override
  Widget build(BuildContext context ){
    return Scaffold(
      appBar: AppBar(
        title : const Text('Home page'),
      ),
      //ListView with dynamic data
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context,index){
          final item = items[index];
          // Reusable Widget
          return  CustomCard(
            title : item['title']!,
            imageUrl : item['image']!,
            onTap: () {
              //Navigate and Pass data
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondScreen(
                    title : item['title']!,
                    imageUrl : item['image']!,
                    description : item['description']!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}