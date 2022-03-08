import 'package:to_do_bloc_app_test/src/to_do_module/models/toDoModel.dart';

/*
*
* created by Matias Ramos 7/03/2022
*
* */

class ExamplesItems {
  final List<ToDoModel> _itemsMocks = [
    ToDoModel("Hacer mi lista"),
    ToDoModel("Nota Mock de Prueba")
  ];

  List<ToDoModel> get itemsMocks => _itemsMocks;
}

ExamplesItems examplesItems = ExamplesItems();
