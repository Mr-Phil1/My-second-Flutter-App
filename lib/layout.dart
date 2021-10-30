import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget mainWidget() {
  return materialCard();
}

Widget materialCard() {
  return SizedBox(
    height: 240,
    child: Card(
      child: Column(
        children: const [
          ListTile(
            title: Text(
              'Danke fürs Zusehen :)',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text('Lasst eine positive Berwertung hier'),
            leading: Icon(
              Icons.star_rate,
              color: Colors.blue,
            ),
          ),
          Divider(),
          ListTile(
            title: Text(
              'Danke fürs Zusehen :)',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text('Lasst eine positive Berwertung hier'),
            leading: Icon(
              Icons.star_rate,
              color: Colors.blue,
            ),
          ),
          Divider(),
          ListTile(
            title: Text(
              'Danke fürs Zusehen :)',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text('Lasst eine positive Berwertung hier'),
            leading: Icon(
              Icons.star_rate,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget gridView() {
  return GridView.extent(
    maxCrossAxisExtent: 150,
    padding: const EdgeInsets.all(4),
    mainAxisSpacing: 4,
    crossAxisSpacing: 4,
    children: _buildGridList(50),
  );
}

List<Widget> _buildGridList(int i) => List.generate(
    i,
    (index) => Stack(alignment: const Alignment(0, 0.8), children: [
          const CircleAvatar(
            backgroundImage: NetworkImage('https://picsum.photos/150'),
            radius: 150,
          ),
          Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.black38,
              ),
              child: const Text(
                'Text',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white70,
                ),
              ))
        ]));

Widget container() {
  return Expanded(
      child: Container(
    decoration: BoxDecoration(
        color: Color(0x85a02525),
        border: Border.all(
          color: Color(0x85000000),
          width: 5,
        ),
        borderRadius: BorderRadius.circular(4)),
    child: Image.network('https://picsum.photos/100'),
    margin: const EdgeInsets.all(4),
  ));
}
