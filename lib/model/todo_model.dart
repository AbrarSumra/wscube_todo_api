class TodoModel {
  int id;
  int userId;
  String todo;
  bool completed;

  TodoModel({
    required this.id,
    required this.userId,
    required this.todo,
    required this.completed,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json["id"],
      userId: json["userId"],
      todo: json["todo"],
      completed: json["completed"],
    );
  }
}

class DataModel {
  int total;
  int skip;
  int limit;
  List<TodoModel> todos;

  DataModel({
    required this.total,
    required this.skip,
    required this.limit,
    required this.todos,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    List<TodoModel> todoList = [];

    for (Map<String, dynamic> eachMap in json["todos"]) {
      var mTodo = TodoModel.fromJson(eachMap);
      todoList.add(mTodo);
    }
    return DataModel(
      total: json["total"],
      skip: json["skip"],
      limit: json["limit"],
      todos: todoList,
    );
  }
}
