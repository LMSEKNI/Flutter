import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter_todo_app/screens/Loginscreen.dart';
import 'package:flutter_todo_app/screens/signup_screen.dart';
import './screens/home_screen.dart';
import 'auth/auth.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    firebase_auth.FirebaseAuth firebaseAuth=firebase_auth.FirebaseAuth.instance;
    void signup()async
    {try{
      await firebaseAuth.createUserWithEmailAndPassword(email: "ahmed@gmail.com", password: "admin123456");
    } catch(e) {
      print(e);
    }

    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo App By Ahmed Msakni',

      routes: {
        '/':(context)=>const Auth() ,
        'homeScreen':(context)=> Homepage(),
        'signupScreen':(context)=> const SignupScreen(),
        'loginScreen':(context)=> const Loginscreen(),
      },
      );

  }
}
