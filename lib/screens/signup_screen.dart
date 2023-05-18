import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _ConfirmpasswordController= TextEditingController();

  Future signUp() async{
   if(passwordconfirmed()){
     await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailController.text.trim(), password: _passwordController.text.trim(),);
     Navigator.of(context).pushNamed('/');
   }
   else{
     showDialog(context: context, builder: (context)=>AlertDialog(
       title: Text('Password Not Confirmed'),
       content: Text('Confirmation password error: the two passwords are different'),
       actions: [
         TextButton(onPressed:() {Navigator.pop(context);}, child: Text('Retry'))
       ],
     ),);
   }
  }
  bool passwordconfirmed(){
    if(_passwordController.text.trim()==_ConfirmpasswordController.text.trim()){
          return true;
    }else
    {return false;

    }

  }
  void openSignupScreen(){
    Navigator.of(context).pushReplacementNamed('signupScreen');
  }
  void openSignONScreen(){
    Navigator.of(context).pushReplacementNamed('loginScreen');
  }


  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _ConfirmpasswordController.dispose();
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
                  Text('SIGN UP',
                    style: GoogleFonts.robotoCondensed(
                        fontSize: 40, fontWeight: FontWeight.bold),
                  ),

                  // Subtitle
                  Text('Welcome ! Here you can sign up :)',
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

                  SizedBox(height: 10),
                  // ConfirmPassword Textfield

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
                          controller: _ConfirmpasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Confirm Password',
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
                      onTap: signUp,
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.amber[900],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(child: Text('Sign UP',
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
                      Text('Already a member? ',
                          style: GoogleFonts.robotoCondensed(
                            fontWeight: FontWeight.bold,)),
                      GestureDetector(
                        onTap: openSignONScreen,
                        child: Text('Sign in here',
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

