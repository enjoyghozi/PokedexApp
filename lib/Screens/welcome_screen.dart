import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(24),
          child: Column(
            children: [
              _header(context),
              _description(context),
              _image(context),
              _button(context)
            ],
          ),
        )
      ),
    );
  }

  _header(context) {
    return Column(
      children: [
        SizedBox(height: 40),
        Center(
          child: Text("Pokedex.", 
              textAlign: TextAlign.center,
              style: TextStyle(
              fontSize: 40, 
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
        SizedBox(height: 80),
        Center(
          child: Text("Welcome to Pokedex", 
              textAlign: TextAlign.center,
              style: TextStyle(
              fontSize: 17, 
              color: Colors.grey,
              ),
          ),
        ),
        Center(
          child: Text("You can find your favorite pokemon here", 
              textAlign: TextAlign.center,
              style: TextStyle(
              fontSize: 17, 
              color: Colors.grey,
              ),
          ),
        ),
      ],
    );
  }

  _image(context) {
    return Container(
      width: 150,
      child: Column(
        children: [
          SizedBox(height: 125),
          Image.asset('images/pokeball.png'),
        ],
      ),
    );
  }
  
  _button(context)  {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 150),
          Align(
            alignment: Alignment.center,
            child: InkWell(
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: Icon(
                    Icons.arrow_forward,
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
        ],
      ),
    );
  }
}