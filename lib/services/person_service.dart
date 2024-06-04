import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:randomuser_api_flutter/models/person.dart';

class PersonService {
  final String baseUrl = "https://randomuser.me/api/";

  Future<List<Person>> searchPeople(int count) async {
    final response = await http.get(Uri.parse("$baseUrl?results=$count"));
    if (response.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(response.body);
      List maps = jsonResponse["results"];
      return maps.map((map) => Person.fromJson(map)).toList();
    } else {
      print("Error: ${response.statusCode}");
    }
    return [];
  }
}
