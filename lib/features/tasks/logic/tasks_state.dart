part of 'tasks_cubit.dart';

abstract class TasksState extends Equatable {
  const TasksState();
}

class TasksInitial extends TasksState {
  @override
  List<Object> get props => [];
}

class TasksLoaded extends TasksState {
  final List<Task> tasks;

  const TasksLoaded({required this.tasks});

  @override
  List<Object> get props => [tasks];
}

class TasksError extends TasksState {
  final String message;

  const TasksError({required this.message});

  @override
  List<Object> get props => [message];
}

class TaskAdded extends TasksState {
  final Task task;

  const TaskAdded({required this.task});

  @override
  List<Object> get props => [task];
}

class TaskUpdated extends TasksState {
  final Task task;

  const TaskUpdated({required this.task});

  @override
  List<Object> get props => [task];
}

class TaskDeleted extends TasksState {
  final int taskId;

  const TaskDeleted({required this.taskId});

  @override
  List<Object> get props => [taskId];
}

class PageChanged extends TasksState {
  final int page;

  const PageChanged({required this.page});

  @override
  List<Object> get props => [page];
}