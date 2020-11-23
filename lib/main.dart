import 'package:dimofinf/providers/auth.dart';
import 'package:dimofinf/providers/store_image.dart';
import 'package:dimofinf/screens/login_screen.dart';
import 'package:dimofinf/screens/pick_screen.dart';
import 'package:dimofinf/screens/tabs_screen.dart';
import 'package:dimofinf/screens/view_image.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider<StoreImage>(create: (_) => StoreImage()),
        ChangeNotifierProvider<Auth>(create: (_)=>Auth(),),
      ],
      child: Container(
        child: MaterialApp(
          title: 'Dimofinf',
          theme: ThemeData(
            primarySwatch: Theme.of(context).primaryColor,
            accentColor: Colors.teal,
            fontFamily: 'Lato',
            textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontSize: 20,
                fontFamily: 'Lato',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          routes: {
            '/': (ctx) =>  LoginScreen(),
            TabsScreen.routeName:(ctx) => TabsScreen(),
            TakePicScreen.routeName: (ctx) => TakePicScreen(),
            ViewImages.routeName: (ctx) => ViewImages(),

          },
        ),
      ),);
  }
}

