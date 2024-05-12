import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/models/Task.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  List<Task> tasks = [];
  TasksCubit() : super(TasksInitial());

}
