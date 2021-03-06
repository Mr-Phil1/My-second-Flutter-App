import 'package:demo_app/layout.dart';
import 'package:flutter/material.dart';
import 'package:super_hero/super_hero.dart';

import './detailed_superhero_info.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My SuperHero Picker',
      home: SuperHeroNameGenerator(),
    );
  }
}

class SuperHeroNameGenerator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SuperHeroName();
}

class _SuperHeroName extends State<SuperHeroNameGenerator> {
  final _SuperHeroNames = <String>[];
  final _hearted = <String>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to my SuperHero Picker'),
      ),
      body: //_buildBody(),
      mainWidget(),
    );
  }

  Widget _buildBody() {
    return ListView.builder(
        padding: EdgeInsets.all(16),
        itemBuilder: (context, i) {
          if (i.isOdd) {
            return Divider();
          }
          if (i ~/ 2 >= _SuperHeroNames.length) {
            _SuperHeroNames.addAll(_generateSuperHeroNames());
          }
          return _buildRow(_SuperHeroNames[i ~/ 2]);
        });
  }

  Iterable<String> _generateSuperHeroNames() {
    List<String> myNames = [
      SuperHero.random(),
      SuperHero.random(),
      SuperHero.random(),
      SuperHero.random(),
      SuperHero.random(),
      SuperHero.random(),
      SuperHero.random(),
      SuperHero.random(),
      SuperHero.random(),
      SuperHero.random()
    ];
    return myNames;
  }

  Widget _buildRow(String superHeroName) {
    final _markedFav = _hearted.contains(superHeroName);
    return ListTile(
      title: Text(superHeroName),
      trailing: Icon(
        _markedFav ? Icons.favorite : Icons.favorite_border,
        color: _markedFav ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          _markedFav
              ? _hearted.remove(superHeroName)
              : _hearted.add(superHeroName);
        });
      },
      onLongPress: () {
        _pushExample(superHeroName);
      },
    );
  }

  void _pushExample(String superHeroName) {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        return superHeroDetail(superHeroName);
      });
    }));
  }
}
