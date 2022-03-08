import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_bloc_app_test/src/to_do_module/bloc/toDoBloc.dart';
import 'package:to_do_bloc_app_test/src/to_do_module/models/examplesItems.dart';
import 'package:to_do_bloc_app_test/src/to_do_module/states/toDoState.dart';
import 'package:to_do_bloc_app_test/src/to_do_module/views/toDoView.dart';

/*
*
* created by Matias Ramos 7/03/2022
*
* */

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ToDoListApp Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<ToDoBloc>(
        create: (context)=> ToDoBloc(CompleteState(examplesItems.itemsMocks)),
        child: const ToDoView(title: 'ToDoListApp Demo'),
      ),
    );
  }
}
