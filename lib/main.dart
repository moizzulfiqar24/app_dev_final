// import 'package:app_dev_final/addData.dart';
import 'package:app_dev_final/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/home_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping App',
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (_) => HomeScreen(),
        '/cards': (_) => CardsScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.pink,
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
