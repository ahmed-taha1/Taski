import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taski/core/helpers/spacing.dart';
import 'package:taski/core/models/Task.dart';
import 'package:taski/core/widgets/custom_input_field.dart';
import 'package:taski/features/tasks/logic/tasks_cubit.dart';

void displayBottomSheet(
    {required BuildContext context,
    required TextEditingController titleController,
    required TextEditingController descriptionController,
    bool isEditing = false,
    int? taskId,
    int? isCompleted}) {
  final creatingActions = Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      TextButton(
        onPressed: () {
          context.read<TasksCubit>().addTask();
          Navigator.pop(context);
        },
        child: Text(
          'Create',
          style: TextStyle(
            fontSize: 15,
            color: Theme.of(context).indicatorColor,
          ),
        ),
      ),
    ],
  );

  final editingActions = Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      TextButton(
        onPressed: () {
          context.read<TasksCubit>().deleteTask(
                Task(
                  title: titleController.text,
                  description: descriptionController.text,
                  isCompleted: isCompleted!,
                  id: taskId,
                ),
              );
          Navigator.pop(context);
        },
        child: const Text(
          'Delete',
          style: TextStyle(
            fontSize: 15,
            color: Colors.redAccent,
          ),
        ),
      ),
      TextButton(
        onPressed: () {
          context.read<TasksCubit>().updateTask(
                Task(
                  id: taskId,
                  title: titleController.text,
                  description: descriptionController.text,
                  isCompleted: isCompleted!,
                ),
              );
          Navigator.pop(context);
        },
        child: Text(
          'Update',
          style: TextStyle(
            fontSize: 15,
            color: Theme.of(context).indicatorColor,
          ),
        ),
      ),
    ],
  );

  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  verticalSpace(20),
                  Container(
                    height: 5,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  verticalSpace(20),
                  const Text(
                    'Add Task',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomInputField(
                    icon: const Icon(Icons.check_box_outline_blank_rounded),
                    hintText: 'What’s in your mind?',
                    controller: titleController,
                  ),
                  const SizedBox(height: 20),
                  CustomInputField(
                    icon: const Icon(Icons.edit_rounded),
                    hintText: 'Add a note...',
                    controller: descriptionController,
                  ),
                  const SizedBox(height: 20),
                  isEditing ? editingActions : creatingActions,
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     TextButton(
                  //       onPressed: () {
                  //         context.read<TasksCubit>().addTask();
                  //         Navigator.pop(context);
                  //       },
                  //       child: Text(
                  //         'Create',
                  //         style: TextStyle(
                  //           fontSize: 15,
                  //           color: Theme.of(context).indicatorColor,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  verticalSpace(20),
                ],
              ),
            ),
          ),
        );
      });
}
