import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

Future<http.Response> fetchBitcoinPrice() async {
  final response = await http.get(Uri.https("blockchain.info", 'ticker'));
  return response;
}

Widget buildBitcoinPrice() {
  return FutureBuilder<http.Response>(
    future: fetchBitcoinPrice(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        int statusCode = snapshot.data!.statusCode;
        if (statusCode == 200) {
          return Text(
              "${BitcoinPrice.fromJson(jsonDecode(snapshot.data!.body)).eur} Euro");
        }
        return Text('$statusCode');
      } else if (snapshot.hasError) {
        return Text("${snapshot.error}");
      }
      return const CircularProgressIndicator();
    },
  );
}

class BitcoinPrice {
  final double eur;
  final double usd;

  BitcoinPrice({required this.eur, required this.usd});

  factory BitcoinPrice.fromJson(Map<String, dynamic> json) {
    return BitcoinPrice(eur: json['EUR']['15m'], usd: json['USD']['15m']);
  }
}
