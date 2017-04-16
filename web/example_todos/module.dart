import 'package:recompose_dart/recompose_dart.dart';
import 'package:over_react/over_react.dart';
import './models.dart';

class TodoProps extends StateMgr {
  Function addTodo;
  Function removeTodo;
  Iterable<Todo> todos;
  String title;
}

FunctionalComponent<TodoProps> creatorBranch = branch<TodoProps>(
  (TodoProps props) => props.state['creating'],
  todoCreator,
  (_) => Dom.div()(),
);

ReactElement todosComponent(TodoProps props) => Dom.div()(
      todoHeader(props),
      creatorBranch(props),
      todoItems(props),
    );

ReactElement todoHeader(TodoProps props) => Dom.div()(
      '${props.title} TODOS: (${props.todos.length})',
      (Dom.button()
        ..onClick = (_) => props.setState({
              'creating': true,
              'value': '',
            }))('add'),
    );

ReactElement todoItems(TodoProps props) => Dom.div()(
      props.todos.map(
        (Todo todo) => todoItem(todo),
      ),
    );

ReactElement todoCreator(TodoProps props) => (Dom.div())(
      todoInput(props),
      todoInputSubmit(props),
    );

ReactElement todoInput(TodoProps props) => (Dom.input()
  ..type = "text"
  ..value = props.state['value']
  ..onChange = (e) => props.setState({'value': e.target.value}))();

ReactElement todoInputSubmit(TodoProps props) =>
    (Dom.button()..onClick = (_) => props.addTodo()(props.state['value']))();

ReactElement todoItem(Todo todo) => (Dom.div()..key = todo.id)(
      todo.text,
    );
