import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/feature/cubit/todo_cubit.dart';
import 'package:todo_list/feature/todo_repository.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Todo List'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Completed'),
              Tab(text: 'Not Completed'),
            ],
          ),
        ),
        body: BlocProvider(
          create: (context) => TodoCubit(TodoRepository()),
          child: BlocBuilder<TodoCubit, TodoState>(
            builder: (context, state) {
              if (state.notCompleted.isNotEmpty) {
                return TabBarView(
                  children: [
                    ListView.builder(
                      itemCount: state.notCompleted.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 50,
                          width: 50,
                          child: Column(
                            children: [
                              Text('${state.notCompleted[index].completed}'),
                              Text('${state.notCompleted[index].title}'),
                            ],
                          ),
                        );
                      },
                    ),
                    ListView.builder(
                      itemCount: state.completed.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 50,
                          width: 50,
                          child: Column(
                            children: [
                              Text('${state.completed[index].completed}'),
                              Text('${state.completed[index].title}'),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
