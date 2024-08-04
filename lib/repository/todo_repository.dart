import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_advanced_task7/models/todos.dart';

class TodoRepo {
  Future<List<Todos>?> getTodos() async {
    try {
      var result = await rootBundle.loadString("assets/data.json");
      var todos = json.decode(result);
      return List<Todos>.from(
          todos.map((json) => Todos.fromJson(json)).toList());
    } catch (e) {
      return null;
    }
  }
}
