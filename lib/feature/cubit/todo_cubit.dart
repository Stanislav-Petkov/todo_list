import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_list/feature/todo_dto.dart';
import 'package:todo_list/feature/todo_repository.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit(this.repository) : super(TodoState([], [])) {
    fetch();
  }

  final TodoRepository repository;

  Future<void> fetch() async {
    final notCompleted = <TodoDto>[];
    final completed = <TodoDto>[];
    var list = await repository.fetch();
    list?.forEach((e) {
      if (e.completed == false) {
        notCompleted.add(e);
      }
    });
    list?.forEach((e) {
      if (e.completed == true) {
        completed.add(e);
      }
    });
    emit(TodoState(notCompleted, completed));
  }
}
