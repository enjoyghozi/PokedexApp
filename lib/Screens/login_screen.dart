import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pokedexapp/Screens/home_screen.dart';
import 'package:pokedexapp/Screens/signup_screen.dart';

import '../Widget/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        body: Container(
          margin: EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _logo(context),
                _header(context),
                _description(context),
                _inputField(context),
                _buttonSignIn(context),
                _row(context)
              ],
            ),
          ),
        )
      ),
    );
  }
  _logo(context) {
    return Container(
      height: 200,
      width: 350,
      child: Column(
        children: [
          SizedBox(height: 50),
          Image.asset('images/pokemon_logo.png'),
        ],
      ),
    );
  }

  _header(context) {
    return Column(
      children: [
        Center(
          child: Text("Let's get started. ", 
              textAlign: TextAlign.center,
              style: TextStyle(
              fontSize: 33, 
              fontWeight: FontWeight.bold, 
              color: Colors.amber,
              ),
          ),
        ),
      ],
    );
  }
  _description(context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Center(
          child: Text("There's No Sense In Going Out Of", 
              textAlign: TextAlign.center,
              style: TextStyle(
              fontSize: 17, 
              fontWeight: FontWeight.bold, 
              color: Colors.grey,
              ),
          ),
        ),
        Center(
          child: Text("Your Way To Get Somebody To Like You.", 
              textAlign: TextAlign.center,
              style: TextStyle(
              fontSize: 17, 
              fontWeight: FontWeight.bold, 
              color: Colors.grey,
              ),
          ),
        ),
      ],
    );
  }
  _inputField(context) {
    return Column(
      children: [
        SizedBox(height: 50),
        Align(
          alignment: Alignment.bottomLeft,
          child: Text("Name",
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.blue
            ),
          ),
        ),
        CustomTextFormField(
          controller: _nameController, 
          hintText: 'Enter your name', 
          obscureText: false, 
          icon: Icons.person,
          validator: (value){
            if(value == ''){
              return "Please enter your name";
            }else {
              return null;
            }
          },
        ),
        SizedBox(height: 20),
        Align(
            alignment: Alignment.bottomLeft,
            child: Text("Password",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.blue
              ),
            ),
          ),
        TextFormField(
          controller: _passwordController, 
          decoration: InputDecoration(
            hintText: 'Enter your password', 
            prefixIcon: Icon(Icons.lock),
            prefixIconColor: Colors.blue,
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                color: Colors.blue,
                width: 1.0,
              ),
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              child: Icon(_obscureText 
              ? Icons.visibility 
              : Icons.visibility_off),
            )
          ),
          obscureText: _obscureText, 
          validator: (value){
            if(value == ''){
              return "Please enter your password";
            }else {
              return null;
            }
          },
        ),
      ],
    );
  }

  _buttonSignIn(context) {
    return Column(
      children: [
        SizedBox(height: 80),
        InkWell(
          child: Container(
            height: 55,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Center(
              child: Text('Sign In',
                  style: TextStyle( 
                      color: Colors.white, 
                      fontSize: 18, 
                      fontWeight: FontWeight.bold
                    ))
                  ),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(50)
            ),
          ),
          onTap: () {
            print('sign in pressed');
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext) => HomeScreen()));
          }
        ),
      ],
    );
  }
  _row(context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Don't have an account?"),
            TextButton(onPressed: () {
              print('Sign up button');
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext) => SignUpScreen()));
            }, child: Text("Sign Up", 
                style: TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.bold, 
                ), 
              )
            )
          ],
        ),
      ],
    );
  }
}