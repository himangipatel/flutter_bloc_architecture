import 'package:equatable/equatable.dart';

class Todo extends Equatable{
  final bool complete;
  final String id;
  final String note;
  final String task;

  Todo(
      this.task, {
        this.complete = false,
        String note = '',
        String? id,
      })  : this.note = note ?? '',
        this.id = id ?? '211';

  Todo copyWith({bool? complete, String? id, String? note, String? task}) {
    return Todo(
      task ?? this.task,
      complete: complete ?? this.complete,
      id: id ?? this.id,
      note: note ?? this.note,
    );
  }

  
  @override
  List<Object?> get props => throw UnimplementedError();

}