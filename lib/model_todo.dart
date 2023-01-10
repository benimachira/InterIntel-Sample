

class ModelToDo {
  dynamic? userId;
  dynamic? id;
  dynamic? title;
  dynamic? completed;

  ModelToDo.fromapi(Map data) {
    this.userId = data['userId'];
    this.id = data['id'];
    this.title = data['title'];
    this.completed =data['completed'];
  }

  ModelToDo();

}
