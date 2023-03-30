class TodoModel {
   int? id;
   String? content;

  TodoModel({this.id, this.content});

  TodoModel.fromData(this.id, this.content);


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> json) => TodoModel(
        id: json["id"],
        content: json["content"],
      );


}
