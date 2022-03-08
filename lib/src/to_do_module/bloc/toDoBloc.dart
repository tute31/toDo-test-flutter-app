import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_bloc_app_test/src/to_do_module/models/examplesItems.dart';
import 'package:to_do_bloc_app_test/src/to_do_module/models/toDoModel.dart';

import '../events/toDoEvent.dart';
import '../states/toDoState.dart';


/*
*
* created by Matias Ramos 7/03/2022
* */

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  ToDoBloc(ToDoState initialState) : super(initialState) {
    on<AddItemEvent>((event, emit) => _add(event, emit));
  }

  Stream<ToDoState> mapEventToState(ToDoEvent event) async* {
    if (event is GetItems) {
      //old version mapEventToState
      List<ToDoModel> items = examplesItems.itemsMocks;
      yield CompleteState(items);
    } else if (event is AddItemEvent) {
      examplesItems.itemsMocks.add(event.item);
      yield AddItemState();
      List<ToDoModel> items = examplesItems.itemsMocks;
      yield CompleteState(items);
    }
  }

  //new version emit
  void _add(AddItemEvent event, Emitter<ToDoState> emit) {
    examplesItems.itemsMocks.add(event.item);
    emit(AddItemState());
    List<ToDoModel> items = examplesItems.itemsMocks;
    emit(CompleteState(items));
  }
}
