import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taski/core/models/Task.dart';
import 'package:taski/features/tasks/logic/tasks_cubit.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        context.read<TasksCubit>().editTask(context, task);
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFFF5F7F9),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    context.read<TasksCubit>().changeCompleteStatus(task);
                  },
                  icon: Icon(
                    task.isCompleted == 0
                        ? Icons.check_box_outline_blank_rounded
                        : Icons.check_box_rounded,
                    color: task.isCompleted == 0
                        ? Theme.of(context).secondaryHeaderColor
                        : Theme.of(context).indicatorColor,
                    size: 25,
                  ),
                ),
                Text(
                  task.title,
                  style: TextStyle(
                    fontSize: 15,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            task.description.isEmpty
                ? const SizedBox.shrink()
                : Padding(
                    padding: const EdgeInsets.only(left: 45),
                    child: Text(
                      task.description,
                      style: TextStyle(
                        fontSize: 13,
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
