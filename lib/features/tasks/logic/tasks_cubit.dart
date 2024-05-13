import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taski/core/models/Task.dart';
import 'package:taski/features/tasks/data/i_tasks_repo.dart';
import 'package:taski/features/tasks/ui/widgets/bottom_sheet.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  int displayTaskWithStatus = 0;
  List<Task> tasks = [];
  final ITasksRepo _tasksRepo;
  int currPageIndex = 0;

  TasksCubit(this._tasksRepo) : super(TasksInitial()) {
    getTasks();
  }

  Future<void> getTasks() async {
    try {
      tasks = await _tasksRepo.getTasks();
      emit(TasksLoaded(tasks: tasks));
    } catch (e) {
      emit(TasksError(message: e.toString()));
    }
  }

  Future<void> addTask() async {
    try {
      Task task = Task(
        title: titleController.text,
        description: descriptionController.text,
        isCompleted: 0,
      );
      Task newTask = await _tasksRepo.addTask(task);
      tasks.add(newTask);
      emit(TaskAdded(task: newTask));
    } catch (e) {
      emit(TasksError(message: e.toString()));
    }
  }

  Future<void> updateTask(Task task) async {
    try {
      Task updatedTask = await _tasksRepo.updateTask(task);
      tasks =
          tasks.map((e) => e.id == updatedTask.id ? updatedTask : e).toList();
      emit(TaskUpdated(task: updatedTask));
    } catch (e) {
      emit(TasksError(message: e.toString()));
    }
  }

  Future<void> deleteTask(Task task) async {
    try {
      await _tasksRepo.deleteTask(task);
      tasks.removeWhere((element) => element.id == task.id);
      emit(TaskDeleted(taskId: task.id!));
    } catch (e) {
      emit(TasksError(message: e.toString()));
    }
  }

  Future<void> changeCompleteStatus(Task task) async {
    try {
      Task updatedTask = Task(
        title: task.title,
        description: task.description,
        isCompleted: 1 - task.isCompleted,
        id: task.id,
      );
      tasks =
          tasks.map((e) => e.id == updatedTask.id ? updatedTask : e).toList();
      emit(TaskUpdated(task: updatedTask));
      await _tasksRepo.updateTask(updatedTask);
    } catch (e) {
      emit(TasksError(message: e.toString()));
    }
  }

  void changePageIndex(int index, BuildContext context) {
    switch (index) {
      case 0:
        displayTaskWithStatus = 0;
        currPageIndex = index;
        break;
      case 1:
        titleController.clear();
        descriptionController.clear();
        displayBottomSheet(
          context: context,
          titleController: titleController,
          descriptionController: descriptionController,
        );
        break;
      case 2:
        // tasks.sort((a, b) => a.isCompleted.compareTo(b.isCompleted));
        // emit(TasksLoaded(tasks: tasks));
        currPageIndex = index;
        break;
      case 3:
        currPageIndex = index;
        displayTaskWithStatus = 1;
        break;
    }
    emit(PageChanged(page: index));
  }

  void editTask(BuildContext context, Task task) {
    titleController.text = task.title;
    descriptionController.text = task.description;
    displayBottomSheet(
      context: context,
      titleController: titleController,
      descriptionController: descriptionController,
      isEditing : true,
      taskId: task.id,
      isCompleted: task.isCompleted,
    );
  }
}
