import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pokedexapp/Data/pokemon_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(children: [
              Row(
                children: [
                  _textGreeting(context),
                  Spacer(),
                  _circleAvatar(context),
                ],
              ),
              Column(
                children: [
                  _header(context),
                  _searchBar(context),
                  _listView(context),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }

  // Section Text Greeting
  _textGreeting(context) {
    return Column(
      children: [
        // SizedBox(height:25),
        Text(
          "Hello, {your name}",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
  // End Text Greeting

  // Section Circle Avatar
  _circleAvatar(context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
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
        // SizedBox(height: 40),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Pokedex",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.amber,
            ),
          ),
        ),
      ],
    );
  }
  // End Header

  // Section Search Bar
  _searchBar(context) {
    return Column(
      children: [
        SizedBox(height: 10),
        TextField(
          style:
              TextStyle(color: Color.fromARGB(255, 39, 39, 39), fontSize: 15),
          decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromARGB(239, 233, 230, 230),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 17),
              hintText: "Search Pokemon",
              hintStyle: TextStyle(color: Colors.grey),
              prefixIcon: Icon(Icons.search)),
        )
      ],
    );
  }
  // End Search Bar

  //  Section List Data
  _listView(context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Container(
          height: 700,
          width: 700,
          child: ListView.builder(
              itemCount: pokemon_data.length,
              itemBuilder: (context, index) {
                final pokemon = pokemon_data[index];
                return Card(
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          'images/List/${pokemon.id}.png',
                          height: 100,
                          width: 100,
                        ),
                      ),
                    ),
                    Column(
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Text(
                              "${pokemon.id}",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              " ${pokemon.name}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Wrap(
                          spacing: 4.0,
                          runSpacing: 4.0,
                          children: pokemon.types
                              .map(
                                (type) => Chip(
                                  label: Text(type),
                                  backgroundColor: const Color(0xFFdfe6e9),
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ]),
                );
              }),
        ),
      ],
    );
  }
  // End List Data
}
