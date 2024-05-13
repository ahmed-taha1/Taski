import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taski/features/tasks/logic/tasks_cubit.dart';
import 'package:taski/features/tasks/ui/widgets/tasks_view_body.dart';
import 'package:taski/features/tasks/ui/widgets/bottom_sheet.dart';

class TasksView extends StatelessWidget {
  const TasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: const TasksViewBody(),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BlocBuilder<TasksCubit, TasksState>(
          builder: (context, state) {
            return BottomNavigationBar(
              elevation: 2,
              type: BottomNavigationBarType.fixed,
              enableFeedback: false,
              backgroundColor: const Color(0xFFFFFFFF),
              showUnselectedLabels: true,
              unselectedItemColor: const Color(0xFFC6CFDC),
              selectedItemColor: Theme.of(context).indicatorColor,
              currentIndex: context.read<TasksCubit>().currPageIndex,
              onTap: (index) {
                context.read<TasksCubit>().changePageIndex(index, context);
                // if (index == 1) {
                //   displayBottomSheet(
                //       context: context,
                //       titleController: context.read<TasksCubit>().titleController,
                //       descriptionController:
                //           context.read<TasksCubit>().descriptionController);
                // }
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 2),
                    child: Icon(
                      Icons.toc_rounded,
                      size: 29,
                    ),
                  ),
                  label: 'Todo',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 2.0),
                    child: Icon(
                      Icons.add_box_outlined,
                      size: 29,
                    ),
                  ),
                  label: 'Create',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 2.0),
                    child: Icon(
                      Icons.search_rounded,
                      size: 29,
                    ),
                  ),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 2.0),
                    child: Icon(
                      Icons.check_box_rounded,
                      size: 29,
                    ),
                  ),
                  label: 'Done',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
