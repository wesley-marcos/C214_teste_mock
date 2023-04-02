import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Word {

  final String definition;
  final String partOfSpeech;
  final String synonyms;
  final String derivation;
  final String examples;

  // Construtor
  const Word({
    required this.definition,
    required this.partOfSpeech,
    required this.synonyms,
    required this.derivation,
    required this.examples
  });

  // Convertendo para Json
  factory Word.fromJson(Map<String, dynamic>  json){

    return Word(
        definition: json['definition'],
        partOfSpeech: json['partOfSpeech'],
        synonyms: json['synonyms'],
        derivation: json['derivation'],
        examples: json['examples']);
  }

  Future<Word> fetchWord(http.Client client) async {

    final response = await client
        .get(Uri.parse('https://wordsapiv1.p.mashape.com/words'));

    if (response.statusCode == 200) {
      return Word.fromJson(jsonDecode(response.body));
    }

    else {
      throw Exception('Failed to load the words :(');
    }
  }
}