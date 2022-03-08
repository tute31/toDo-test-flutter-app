import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_bloc_app_test/src/to_do_module/bloc/toDoBloc.dart';
import 'package:to_do_bloc_app_test/src/to_do_module/events/toDoEvent.dart';
import 'package:to_do_bloc_app_test/src/to_do_module/models/toDoModel.dart';
import 'package:to_do_bloc_app_test/src/to_do_module/states/toDoState.dart';
import 'package:to_do_bloc_app_test/src/utils/utils.dart';

/*
*
* created by Matias Ramos 7/03/2022
*
* */


class ToDoView extends StatefulWidget {
  const ToDoView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ToDoView> createState() => _ToDoViewState();
}

class _ToDoViewState extends State<ToDoView> {
  final List<String> _todoList = <String>[];
  final TextEditingController _txtController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final ToDoBloc bloc = BlocProvider.of<ToDoBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<ToDoBloc, ToDoState>(
        bloc: bloc,
        builder: (BuildContext ctx, ToDoState state) {
          if(state is CompleteState){
            return ListView.builder(
                itemCount: state.items.length,
                itemBuilder: (context, index) {
                  return _titleItemCustom(state.items[index].titleItem);
                }
            );
          }

          return const Center(child: Text("Note APP"));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _manageDialog(context, bloc),
        tooltip: 'Agregar Nota',
        child: const Icon(Icons.add),
      ),
    );
  }

  // item custom
  ListTile _titleItemCustom(String item) {
    return ListTile(title: Text(item, style: Utils.mainTextStyle));
  }

  // manageDialog
  Future<Future> _manageDialog(BuildContext context, ToDoBloc bloc) async {

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Tu Lista', style: Utils.mainTextStyle),
            content: TextField(
              controller: _txtController,
              decoration: const InputDecoration(hintText: 'Ingresar Nota'),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Agregar'),
                onPressed: () {
                  Navigator.of(context).pop();

                  // _addItem(_txtController.text);

                  bloc.add(AddItemEvent(ToDoModel(_txtController.text)));
                },
              ),
              TextButton(
                child: const Text('Cancelar'),
                onPressed: () {
                  Navigator.of(context).pop();

                },
              )
            ],
          );
        });
  }

  void _addItem(String title) {
    setState(() {
      _todoList.add(title);
    });
    _txtController.clear();
  }
}