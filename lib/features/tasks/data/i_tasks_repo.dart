import 'package:taski/core/models/Task.dart';

abstract class ITasksRepo {
  Future<List<Task>> getTasks();
  Future<Task> addTask(Task task);
  Future<Task> updateTask(Task task);
  Future<void> deleteTask(Task task);
}