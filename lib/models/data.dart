import 'package:flutter_advanced_task7/models/todos.dart';

class Data {
  int? code;
  String? status;
  List<Todos>? todos;

  Data({this.code, this.status, this.todos});

  Data.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    if (json['todos'] != null) {
      todos = <Todos>[];
      json['todos'].forEach((v) {
        todos!.add(new Todos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    if (todos != null) {
      data['todos'] = todos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
