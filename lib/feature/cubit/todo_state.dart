part of 'todo_cubit.dart';

class TodoState {
  TodoState(
      this.notCompleted,
      this.completed
      );

  final List<TodoDto> notCompleted;
  final List<TodoDto> completed;
}
