import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taski/core/helpers/spacing.dart';
import 'package:taski/features/tasks/logic/tasks_cubit.dart';
import 'package:taski/features/tasks/ui/widgets/tasks_list.dart';
import 'package:taski/features/tasks/ui/widgets/top_icon.dart';
import 'package:taski/features/tasks/ui/widgets/welcome_msg.dart';

class TasksViewBody extends StatelessWidget {
  const TasksViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopIcon(),
            verticalSpace(20),
            const WelcomeMsg(),
            BlocBuilder<TasksCubit, TasksState>(
              builder: (context, state) {
                int tasksCnt = context
                    .read<TasksCubit>()
                    .tasks
                    .where((task) => task.isCompleted == 0)
                    .toList()
                    .length;
                return Text(
                  'You\'ve got $tasksCnt tasks to do today.',
                  style: TextStyle(
                    fontSize: 15,
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                );
              },
            ),
            verticalSpace(20),
            const Expanded(
              child: TasksList(),
            ),
          ],
        ),
      ),
    );
  }
}
