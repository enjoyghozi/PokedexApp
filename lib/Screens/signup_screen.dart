import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pokedexapp/Screens/login_screen.dart';

import '../Widget/custom_text_form_field.dart';
import 'home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}
final TextEditingController _nameController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final TextEditingController _rePasswordController = TextEditingController();

bool _obscureText = true;
class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
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
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext) => LoginScreen()));
                    }
                  ),
                ),
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('images/Pokemon_register.jpg'),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("Register", 
                  style: TextStyle(
                    fontSize: 33, 
                    fontWeight: FontWeight.bold, 
                    color: Color.fromARGB(228, 255, 218, 7)),),
                ),
                SizedBox(height: 30),
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
                    child: Text("Email",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.blue
                      ),
                    ),
                  ),
                CustomTextFormField(
                  controller: _emailController, 
                  hintText: 'Enter your email', 
                  obscureText: false, 
                  icon: Icons.email,
                  validator: (value){
                    if(value == ''){
                      return "Please enter your email";
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
                    hintText: 'Re-enter your password', 
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
                    return "Please re-enter your password";
                  }else {
                    return null;
                  }
                },
                ),
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
                    print('sign in pressed');
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext) => HomeScreen()));
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}