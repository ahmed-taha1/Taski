import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String title;
  final String description;
  final int isCompleted;
  int? id;

  Task({
    required this.title,
    required this.description,
    required this.isCompleted,
    this.id,
  });

  @override
  List<Object> get props => [title, description, isCompleted];

  static Task fromMap(Map<dynamic, dynamic> map) {
    return Task(
      title: map['title'],
      description: map['description'],
      isCompleted: map['isCompleted'],
      id: map['id'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
      'id': id,
    };
  }
}