import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:taski/core/helpers/spacing.dart';
import 'package:taski/features/tasks/logic/tasks_cubit.dart';
import 'package:taski/features/tasks/ui/widgets/task_widget.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksCubit, TasksState>(
      builder: (context, state) {
        final tasks = context.read<TasksCubit>().tasks;
        int currDisplayingStatus =
            context.read<TasksCubit>().displayTaskWithStatus;
        final filteredTasks = tasks
            .where((task) => task.isCompleted == currDisplayingStatus)
            .toList();
        if (filteredTasks.isEmpty && currDisplayingStatus == 0) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'You have no task listed.',
                  style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).secondaryHeaderColor),
                ),
                verticalSpace(20),
                TextButton.icon(
                  icon: Icon(Icons.add, color: Theme.of(context).indicatorColor,),
                  onPressed: () {
                    context.read<TasksCubit>().changePageIndex(1, context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF007FFF).withOpacity(0.10),
                  ),
                  label: Text(
                    "Create Task",
                    style: TextStyle(color: Theme.of(context).indicatorColor, fontSize: 17),
                  ),
                ),
              ],
            ),
          );
        }
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: filteredTasks.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: TaskWidget(
                task: filteredTasks[index],
              ),
            );
          },
        );
      },
    );
  }
}
