// GENERATED CODE - DO NOT MODIFY BY HAND

part of todo;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class TodoAppState
// **************************************************************************

class _$TodoAppState extends TodoAppState {
  @override
  final int currentGroup;
  @override
  final BuiltList<TodoGroup> todoGroups;

  factory _$TodoAppState([void updates(TodoAppStateBuilder b)]) =>
      (new TodoAppStateBuilder()..update(updates)).build();

  _$TodoAppState._({this.currentGroup, this.todoGroups}) : super._() {
    if (currentGroup == null) throw new ArgumentError.notNull('currentGroup');
    if (todoGroups == null) throw new ArgumentError.notNull('todoGroups');
  }

  @override
  TodoAppState rebuild(void updates(TodoAppStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  TodoAppStateBuilder toBuilder() => new TodoAppStateBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! TodoAppState) return false;
    return currentGroup == other.currentGroup && todoGroups == other.todoGroups;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, currentGroup.hashCode), todoGroups.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TodoAppState')
          ..add('currentGroup', currentGroup)
          ..add('todoGroups', todoGroups))
        .toString();
  }
}

class TodoAppStateBuilder
    implements Builder<TodoAppState, TodoAppStateBuilder> {
  _$TodoAppState _$v;

  int _currentGroup;
  int get currentGroup => _$this._currentGroup;
  set currentGroup(int currentGroup) => _$this._currentGroup = currentGroup;

  ListBuilder<TodoGroup> _todoGroups;
  ListBuilder<TodoGroup> get todoGroups =>
      _$this._todoGroups ??= new ListBuilder<TodoGroup>();
  set todoGroups(ListBuilder<TodoGroup> todoGroups) =>
      _$this._todoGroups = todoGroups;

  TodoAppStateBuilder();

  TodoAppStateBuilder get _$this {
    if (_$v != null) {
      _currentGroup = _$v.currentGroup;
      _todoGroups = _$v.todoGroups?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TodoAppState other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$TodoAppState;
  }

  @override
  void update(void updates(TodoAppStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$TodoAppState build() {
    final result = _$v ??
        new _$TodoAppState._(
            currentGroup: currentGroup, todoGroups: todoGroups?.build());
    replace(result);
    return result;
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class Todo
// **************************************************************************

class _$Todo extends Todo {
  @override
  final int id;
  @override
  final String text;

  factory _$Todo([void updates(TodoBuilder b)]) =>
      (new TodoBuilder()..update(updates)).build();

  _$Todo._({this.id, this.text}) : super._() {
    if (id == null) throw new ArgumentError.notNull('id');
    if (text == null) throw new ArgumentError.notNull('text');
  }

  @override
  Todo rebuild(void updates(TodoBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  TodoBuilder toBuilder() => new TodoBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Todo) return false;
    return id == other.id && text == other.text;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), text.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Todo')
          ..add('id', id)
          ..add('text', text))
        .toString();
  }
}

class TodoBuilder implements Builder<Todo, TodoBuilder> {
  _$Todo _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _text;
  String get text => _$this._text;
  set text(String text) => _$this._text = text;

  TodoBuilder();

  TodoBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _text = _$v.text;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Todo other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$Todo;
  }

  @override
  void update(void updates(TodoBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Todo build() {
    final result = _$v ?? new _$Todo._(id: id, text: text);
    replace(result);
    return result;
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class TodoGroup
// **************************************************************************

class _$TodoGroup extends TodoGroup {
  @override
  final String name;
  @override
  final BuiltList<Todo> todos;

  factory _$TodoGroup([void updates(TodoGroupBuilder b)]) =>
      (new TodoGroupBuilder()..update(updates)).build();

  _$TodoGroup._({this.name, this.todos}) : super._() {
    if (name == null) throw new ArgumentError.notNull('name');
    if (todos == null) throw new ArgumentError.notNull('todos');
  }

  @override
  TodoGroup rebuild(void updates(TodoGroupBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  TodoGroupBuilder toBuilder() => new TodoGroupBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! TodoGroup) return false;
    return name == other.name && todos == other.todos;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, name.hashCode), todos.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TodoGroup')
          ..add('name', name)
          ..add('todos', todos))
        .toString();
  }
}

class TodoGroupBuilder implements Builder<TodoGroup, TodoGroupBuilder> {
  _$TodoGroup _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  ListBuilder<Todo> _todos;
  ListBuilder<Todo> get todos => _$this._todos ??= new ListBuilder<Todo>();
  set todos(ListBuilder<Todo> todos) => _$this._todos = todos;

  TodoGroupBuilder();

  TodoGroupBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _todos = _$v.todos?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TodoGroup other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$TodoGroup;
  }

  @override
  void update(void updates(TodoGroupBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$TodoGroup build() {
    final result = _$v ?? new _$TodoGroup._(name: name, todos: todos?.build());
    replace(result);
    return result;
  }
}
