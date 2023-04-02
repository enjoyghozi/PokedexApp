import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pokedexapp/Screens/sign_in.dart';

import '../Models/user_model.dart';
import 'home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

  final _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();

  bool _obscureText = true;
class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: _formKey,
        child: Scaffold(
          body: Container(
            margin: EdgeInsets.all(24),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _backButton(context), // Button back
                  _circleAvatar(context), // Circle Avatar
                  _header(context), // Text Header
                  _inputField(context), // Input Form Field
                  _buttonRegister(context) // Button Register
                ],
              ),
            ),
          )
        ),
      ),
    );
  }

  // Section Back button
  _backButton(context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: InkWell(
              child: Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
            onTap: () {
              print('back to LogIn');
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext) => SignInScreen()));
            }
          ),
        ),
      ],
    );
  }
  // End Back button

  // Section Circle Avatar
  _circleAvatar(context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 60,
          backgroundImage: AssetImage('images/Pokemon_register.jpg'),
        ),
      ],
    );
  }
  // End Circle Avatar

  // Section Header
  _header(context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text("Register", 
          style: TextStyle(
            fontSize: 33, 
            fontWeight: FontWeight.bold, 
            color: Color.fromARGB(228, 255, 218, 7)),),
        ),
      ],
    );
  }
  // End Header

  // Section Input Form Field
  _inputField(context) {
    return Column(
      children: [
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
          controller: _nameController, 
          obscureText: false, 
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
            child: Text("Email",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.blue
              ),
            ),
          ),
        TextFormField(
          controller: _emailController, 
          obscureText: false, 
          decoration: InputDecoration(
            hintText: 'Enter your email', 
            prefixIcon: Icon(Icons.email),
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
              return ("Please enter your email");
            }
            if (!RegExp("[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
              return ("Please enter your valid email");
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
        SizedBox(height: 20),
        Align(
            alignment: Alignment.bottomLeft,
            child: Text("Re-Password",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.blue
              ),
            ),
          ),
        TextFormField(
          controller: _rePasswordController, 
          decoration: InputDecoration(
            hintText: 'Re-Enter your password', 
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
            if(_rePasswordController.text.length > 6 && _passwordController.text != value){
              return "Password must be the same";
            }
            if(value!.isEmpty || value == null) {
              return "Please enter your password";
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

  //Section Buton Register
  _buttonRegister(context) {
    return Column(
      children: [
        SizedBox(height: 30),
        InkWell(
          child: Container(
            height: 55,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Center(
              child: Text('Register',
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
            signUp(_emailController.text, _passwordController.text);
            print('sign in pressed');
            // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext) => HomeScreen()));
          }
        ),
      ],
    );
  }
  // End Button Register

  // Section Sign Up
  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth.createUserWithEmailAndPassword(email: email, password: password)
      .then((value) => {
        postDetailsToFirestore()
      }).catchError((e){
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }


  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    
    userModel.email = user!.email;
    userModel.uid = user!.uid;
    userModel.name = _nameController.text;

    await firebaseFirestore
      .collection("users")
      .doc(user.uid)
      .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfuly");

    Navigator.pushAndRemoveUntil(
      (context),
      MaterialPageRoute(builder: (context) => HomeScreen()),
      (route) => false);
  }
}