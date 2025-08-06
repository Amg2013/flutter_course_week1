import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_project/tasks/bloc/fires_stor_repo.dart';
import 'package:iti_project/tasks/models/task_model.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final FiresStorRepo _firesStorRepo;
  StreamSubscription? _streamSubscription;

  TaskBloc(this._firesStorRepo) : super(TaskInitialState()) {
    on<AddTaskEvent>(_onAddTask);
  }

  Future<void> _onAddTask(AddTaskEvent event, Emitter<TaskState> emit) async {
    try {
      await _firesStorRepo.addTask(event.task);
      emit(TaskAddingSuccessState(msg: 'TaskAddingSuccessState'));
    } catch (e) {
      emit(TaskAddingFaildState(msg: 'TaskAddingFaildState'));
    }
  }
}
