class Todos {
  int? id;
  String? title;
  String? description;
  bool? isComplete;

  Todos({this.id, this.title, this.description, this.isComplete});

  Todos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    isComplete = json['is_complete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['is_complete'] = isComplete;
    return data;
  }
}
