import 'package:flutter/material.dart';
import 'package:http/http.dart'
    as http; // you need to add it in  your pubspec.yaml, add dependency http: any
import 'dart:convert';
import 'pokemon.dart';

main() => runApp(MaterialApp(
      title: "Poke App",
      home: HomePage(),
      debugShowCheckedModeBanner: false, //ti disable the debug at the top
    ));

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  var url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  PokeHub pokeHub;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchData();
    // print("2nd work")
  }

  fetchData() async {
    //
    var res = await http.get(url); //await  or wait until you get the response
    var decodedJson = jsonDecode(res.body);

    pokeHub = PokeHub.fromJson(decodedJson);
    print(pokeHub.toJson());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
        backgroundColor: Colors.cyan,
      ),
      drawer: Drawer(),
      body: GridView.count(
        crossAxisCount: 2,
        children: pokeHub.pokemon.map((poke) => Card()).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.cyan,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
