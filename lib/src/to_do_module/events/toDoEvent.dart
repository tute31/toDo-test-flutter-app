import 'package:to_do_bloc_app_test/src/to_do_module/models/toDoModel.dart';

/*
*
* created by Matias Ramos 7/03/2022
*
* */

abstract class ToDoEvent {}

class GetItems extends ToDoEvent {}

class AddItemEvent extends ToDoEvent {
  ToDoModel item;
  AddItemEvent(this.item);
}

class RemoveItem extends ToDoEvent {}
