import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_advanced_task7/models/todos.dart';

class TodoRepo {
  static List<Todos> todosList = [];
  Future<List<Todos>> getTodos() async {
    try {
      var data = await rootBundle.loadString("assets/data.json");
      var result = json.decode(data);
      if (result['status'] == 'OK') {
        todosList = List<Todos>.from(
            result['todos'].map((json) => Todos.fromJson(json)).toList());

        return todosList;
      }
    } catch (e) {
      rethrow;
    }
    return todosList;
  }
}
