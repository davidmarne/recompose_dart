library todo;

import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';

part 'models.g.dart';

abstract class DataModel {}

abstract class TodoAppState implements Built<TodoAppState, TodoAppStateBuilder>, DataModel {
  int get currentGroup;
  BuiltList<TodoGroup> get todoGroups;

  TodoAppState._();
  factory TodoAppState([updates(TodoAppStateBuilder b)]) = _$TodoAppState;
}

abstract class Todo implements Built<Todo, TodoBuilder>, DataModel {
  int get id;
  String get text;

  Todo._();
  factory Todo([updates(TodoBuilder b)]) = _$Todo;
}

abstract class TodoGroup implements Built<TodoGroup, TodoGroupBuilder>, DataModel {
  String get name;
  BuiltList<Todo> get todos;

  TodoGroup._();
  factory TodoGroup([updates(TodoGroupBuilder b)]) = _$TodoGroup;
}
