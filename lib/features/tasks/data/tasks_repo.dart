// import 'package:taski/core/helpers/data_base_helper.dart';
// import 'package:taski/core/models/task.dart';
// import 'package:taski/features/tasks/data/i_tasks_repo.dart';

import 'package:taski/core/helpers/data_base_helper.dart';
import 'package:taski/core/models/Task.dart';
import 'package:taski/features/tasks/data/i_tasks_repo.dart';

class TasksRepo implements ITasksRepo {
  @override
  Future<Task> addTask(Task task) async {
    try {
      int id = await DataBaseHelper.insert(
      '''
        INSERT INTO "Task" (
          "title", "description", "isCompleted") 
        VALUES(
          "${task.title}",
          "${task.description}",
          ${task.isCompleted})
      ''');
      task.id = id;
      return task;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteTask(Task task) async {
    try {
      await DataBaseHelper.delete('''
        DELETE FROM "Task"
        WHERE id = ${task.id}
      ''');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Task>> getTasks() async {
    try{
      List<Map> response = await DataBaseHelper.query('''
        SELECT * FROM "Task"
      ''');
      List<Task> tasks = [];
      for (var element in response) {
        tasks.add(Task.fromMap(element));
      }
      return tasks;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Task> updateTask(Task task) async{
    try{
      await DataBaseHelper.update('''
        UPDATE "Task"
        SET
          "title" = "${task.title}",
          "description" = "${task.description}",
          "isCompleted" = ${task.isCompleted}
        WHERE id = ${task.id}
      ''');
      return task;
    } catch (e) {
      rethrow;
    }
  }
}
