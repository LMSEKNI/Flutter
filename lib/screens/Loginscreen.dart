import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Loginscreen extends StatefulWidget {
  const Loginscreen({Key? key}) : super(key: key);

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  Future signIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text.trim(), password: _passwordController.text.trim(),);
    Navigator.of(context).pushReplacementNamed('homeScreen');
  }
void openSignupScreen(){
    Navigator.of(context).pushReplacementNamed('signupScreen');
}


  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200] ,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                // Image
                  Image.asset('assets/images/todolist-logo.png',
                  height: 250,),
                SizedBox(height: 20),
                // Title
                Text('SIGN IN',
                style: GoogleFonts.robotoCondensed(
                  fontSize: 40, fontWeight: FontWeight.bold),
                ),

                // Subtitle
                Text('Welcome back! Nice to see you again :)',
                  style: GoogleFonts.robotoCondensed(
                      fontSize: 18),
                ),
                SizedBox(height: 25,),
                // Email Textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child:  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                        ),
                      ),
                    ),
                  ),
                ),

                // Password Textfield
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child:  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 15),
                // Sign in button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: GestureDetector(
                  onTap: signIn,
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.amber[900],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(child: Text('Sign in',
                    style: GoogleFonts.robotoCondensed(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    )
                    ),
                  ),
                ),
              ),
                SizedBox(height: 25),


                // Text : sign up
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not yet a member? ',
                      style: GoogleFonts.robotoCondensed(
                        fontWeight: FontWeight.bold,)),
                    GestureDetector(
                      onTap: openSignupScreen,
                      child: Text('Sign up Now',
                      style: GoogleFonts.robotoCondensed(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),),
                    )],
                ),


              ],
            ),
          ),
        ),
      )
    );
  }
}
