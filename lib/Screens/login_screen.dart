import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
bool _obscureText = true;
final TextEditingController _nameController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Container(
            height: 700,
            width: 350,
            child: Column(
              children: [
                Image.asset('images/pokemon_logo.png'),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("Let's get started", 
                  style: TextStyle(
                    fontSize: 33, 
                    fontWeight: FontWeight.bold, 
                    color: Color.fromARGB(228, 255, 218, 7)),),
                ),
                Text("There's No Sense In Going Out Of ", 
                  textAlign: TextAlign.center, 
                  style: TextStyle(
                    fontSize: 17, 
                    fontWeight: FontWeight.bold, 
                    color: Color.fromARGB(227, 161, 161, 158),
                    )),
                Text("Your Way To Get Somebody To Like You", 
                  textAlign: TextAlign.center, 
                  style: TextStyle(
                    fontSize: 17, 
                    fontWeight: FontWeight.bold, 
                    color: Color.fromARGB(227, 161, 161, 158),
                    )),
                SizedBox(height: 40),
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
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: 'Enter your name',
                    ),
                    validator: (value){
                      if(value == ''){
                        return "Please enter your name";
                      }else {
                        return null;
                      }
                    },
                  ),
                SizedBox(height: 40),
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
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: GestureDetector(
                        onTap: () {
                            _obscureText = !_obscureText;
                        },
                        child: Icon(_obscureText 
                          ? Icons.visibility 
                          : Icons.visibility_off),
                      ),
                      hintText: 'Enter your password',
                    ),
                    validator: (value){
                      if(value == ''){
                        return "Please enter your password";
                      }else {
                        return null;
                      }
                    },
                    obscureText: _obscureText,
                  ),
                SizedBox(height: 55),
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
                  }
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: GestureDetector(
                    child: const Text("Don't have an account? Sign Up"),
                      onTap: () {
                        print('Sign up button');
                      },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}