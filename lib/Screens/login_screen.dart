import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            height: 600,
            width: 350,
            child: Column(
              children: [
                Image.asset('images/pokemon_logo.png'),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Text("Let's get started", style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold, color: Color.fromARGB(228, 255, 218, 7)),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("There's No Sense In Going Out Of Your Way To Get Somebody To Like You", textAlign: TextAlign.center, style: TextStyle(fontSize: 19.4, fontWeight: FontWeight.bold, color: Color.fromARGB(227, 161, 161, 158),)),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}