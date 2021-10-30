import 'package:flutter/material.dart';
import 'package:super_hero/super_hero.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My SuperHero Picker',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to my SuperHero Picker'),
        ),
        body: Center(
          child: SuperHeroNameGenerator(),
        ),
      ),
    );
  }
}

class SuperHeroNameGenerator extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SuperHeroName();
}

class _SuperHeroName extends State<SuperHeroNameGenerator>{
  @override
  Widget build(BuildContext context) {
   final superHeroName=SuperHero.random();
   return Text(superHeroName);
  }
}
