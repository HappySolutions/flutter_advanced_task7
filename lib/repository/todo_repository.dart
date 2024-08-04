import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter_advanced_task7/models/todos.dart';

class TodoRepo {
  static List<Todos> todosList = [];
  Future<List<Todos>> getTodos() async {
    // List<Todos> todosList = [];

    try {
      var data = await rootBundle.loadString("assets/data.json");
      var result = json.decode(data);
      if (result['status'] == 'OK') {
        todosList = List<Todos>.from(
            result['todos'].map((json) => Todos.fromJson(json)).toList());
        if (todosList.isNotEmpty) {
          log(todosList.toString());
        } else {
          log('=====>error on getting todos');
        }
        return todosList;
      }
    } catch (e) {
      rethrow;
    }
    return todosList;
  }
}
