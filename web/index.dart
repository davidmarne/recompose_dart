library example;

import 'dart:async';
import 'dart:html';

import 'package:react/react_client.dart' as react_client;
import 'package:react/react_dom.dart' as react_dom;

import './example_todos_w_flux/module.dart';
import './example_todos_w_flux/component.dart';

Future main() async {
  react_client.setClientConfiguration();

  var actions = new TodoActions();
  var store = new TodoStore(actions);

  react_dom.render(
    todosBuilder(new TodoFluxProps(store, actions)),
    querySelector('#container-flux'),
  );
}
