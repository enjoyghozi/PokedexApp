import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pokedexapp/Screens/home_screen.dart';
import 'package:pokedexapp/Screens/signup_screen.dart';

import '../Widget/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey  = GlobalKey<FormState>();

  bool _obscureText = true;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: _formKey,
        child: Scaffold(
          // resizeToAvoidBottomInset: false,
          body: Container(
            margin: EdgeInsets.all(24),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _logo(context), //Logo Pokemon
                  _header(context), // Header
                  _description(context), // Text Description
                  _inputField(context), // Input Form Field
                  _buttonSignIn(context), // Button Sign In
                  _row(context), // Row Text Under Button
                ],
              ),
            ),
          )
        ),
      ),
    );
  }

  // Logo Pokemon
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
  // End Logo Pokemon

  // Section Header
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
  // End Header

  // Text Description
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
  // End Description

  // Input Form Field
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
        TextFormField(
          obscureText: false, 
          controller: _nameController, 
          onSaved: (value) {
            _nameController.text = value!;
          },
          decoration: InputDecoration(
            hintText: 'Enter your name', 
            prefixIcon: Icon(Icons.person),
            prefixIconColor: Colors.blue,
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                color: Colors.blue,
                width: 1.0,
              ),
            ),
          ),
          validator: (value){
            if(value!.isEmpty || _nameController == null){
              return ("Please enter your name");
            }
            if (!RegExp(r'^.{6,}$').hasMatch(value)) {
              return ("Name must be at least 6 characters");
            }
            else {
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
          onSaved: (value) {
            _passwordController.text = value!;
          },
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
            RegExp regex = new RegExp(r'^.{6,}$');
            if(value!.isEmpty || value == null) {
              return "Please enter your password";
            }
            else if (!regex.hasMatch(value)) {
              return ("Password must be at least 6 characters");
            }
            else {
              return null;
            }
          },
        ),
      ],
    );
  }
  // End Input Form Field

  // Button SignIn
  _buttonSignIn(context) {
    return Column(
      children: [
        SizedBox(height: 80),
        MaterialButton(
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
          onPressed: () {
            signIn(_nameController.text, _passwordController.text);
            // signIn(_nameController.text, _passwordController.text);
          }
        ),
      ],
    );
  }
  // End Button

  // Row Text
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
  // End Row Text

  // Section Sign In function
  void signIn (String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((uid) => {
          Fluttertoast.showToast(msg: "login Successful"),
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext) => HomeScreen()))
        }).catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
        });
    }
  }
}