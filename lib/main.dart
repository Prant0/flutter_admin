import 'package:flutter/material.dart';
import 'package:flutter_admin/screen/navigation_bar.dart';
import 'package:flutter_admin/screen/tab/home_page.dart';
import 'package:flutter_admin/widget/menu_controller.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context)=> MenuController()),
        ],
        child: HomePage(),
      ),

    );
  }
}
