import 'package:recompose_dart/recompose_dart.dart';

import './module.dart';
import '../example_todos/module.dart';

class TodoFluxProps extends FluxProps<TodoStore, TodoActions> {
  TodoFluxProps(store, actions) : super(store, actions);
}

FunctionalComponent<TodoFluxProps> todosBuilder = compose<TodoFluxProps, TodoProps>([
  mapStoreToProps<TodoStore, TodoActions, TodoProps>((TodoFluxProps fluxProps) => new TodoProps()
    ..addTodo = ((String content) => fluxProps.actions.addTodo(content))
    ..removeTodo = ((int id) => fluxProps.actions.removeTodo(id))
    ..todos = fluxProps.store.todos
    ..title = 'flux'),
  withState<TodoProps>({'creating': false}),
])(todosComponent);
