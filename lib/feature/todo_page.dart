import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/feature/cubit/todo_cubit.dart';
import 'package:todo_list/feature/todo_repository.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(TodoRepository()),
      child: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          if (state.todo.isNotEmpty) {
            return DefaultTabController(
              initialIndex: 1,
              length: 2,
              child: Scaffold(
                appBar: AppBar(),
                body: TabBarView(
                  children: [
                    ListView.builder(itemBuilder: (context, index) {
                      return SizedBox(
                        height: 50,
                        width: 50,
                        child: Column(
                          children: [
                            Text('${state.todo[index].completed}'),
                            Text('${state.todo[index].title}'),
                          ],
                        ),
                      );
                    }),
                    Center(child: Text('B')),
                  ],
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
