import 'package:w_flux/w_flux.dart' show Store, Action;
import 'package:built_collection/built_collection.dart' show BuiltList;
import '../example_todos/models.dart';

class TodoActions {
  Action addTodo = new Action<String>();
  Action removeTodo = new Action<int>();
}

class TodoStore extends Store {
  BuiltList<Todo> _todos;
  int idCounter = 0;

  Iterable<Todo> get todos => _todos;

  TodoStore(TodoActions actions) {
    _todos = new BuiltList<Todo>();
    manageActionSubscription(
        actions.addTodo.listen((String todo) => _todos = _todos.rebuild((todos) {
              todos.add(new Todo((b) => b
                ..id = new DateTime.now().millisecondsSinceEpoch
                ..content = todo));
              trigger();
            })));
    manageActionSubscription(
      actions.removeTodo.listen(
        (int id) => _todos = _todos.rebuild(
              (todos) => todos.removeWhere((todo) => todo.id == id),
            ),
      ),
    );
  }
}
