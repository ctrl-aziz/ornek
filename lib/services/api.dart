import 'dart:convert';

import 'package:ornek/model/tesis.dart';
import 'package:http/http.dart' as http;

class Api{
  static const String _baseUrl = 'http://95.173.184.125/api';

  static Future<List<Tesis>> getTesisList() async{
    final response = await http.get(Uri.parse('$_baseUrl/tesis-list/'));
    String body = utf8.decode(response.bodyBytes);
    return List.from(jsonDecode(body)).map((e) => Tesis.fromJson(e)).toList();
  }
}