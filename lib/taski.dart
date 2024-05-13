import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taski/features/tasks/data/tasks_repo.dart';
import 'package:taski/features/tasks/logic/tasks_cubit.dart';
import 'package:taski/features/tasks/ui/tasks_view.dart';

class Taski extends StatelessWidget {
  const Taski({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TasksCubit(TasksRepo()),
          lazy: false,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          primaryColor: const Color(0xFF3F3D56),
          secondaryHeaderColor: const Color(0xFF8D9CB8),
          scaffoldBackgroundColor: Colors.white,
          indicatorColor: const Color(0xFF0F77F0),
          // textTheme: GoogleFonts.getFont('Poppins').textTheme,
        ),
        home: const TasksView(),
      ),
    );
  }
}
