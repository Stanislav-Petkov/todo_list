import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_list/feature/todo_dto.dart';
import 'package:todo_list/feature/todo_repository.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit(this.repository) : super(TodoState([])) {
    fetch();
  }

  final TodoRepository repository;

  Future<void> fetch() async {
    await repository.fetch();
  }
}
