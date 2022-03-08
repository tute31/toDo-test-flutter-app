
import 'package:to_do_bloc_app_test/src/to_do_module/models/toDoModel.dart';

abstract class ToDoState{}

class CompleteState extends ToDoState{
  List<ToDoModel> items;
  CompleteState(this.items);
}
class AddItemState extends ToDoState{}
class InitialState extends ToDoState{}