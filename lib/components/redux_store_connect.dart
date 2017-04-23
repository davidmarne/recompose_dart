import 'package:built_redux/built_redux.dart';
import 'package:built_value/built_value.dart';

import '../typedefs/typedefs.dart';
import 'redux_store_component.dart';

class ReduxProps<State extends BuiltReducer<State, StateBuilder>,
    StateBuilder extends Builder<State, StateBuilder>, Actions extends ReduxActions> {
  Store<State, StateBuilder, Actions> store;
  ReduxProps([this.store]);
}

/// Subscribes to the redux [store] and transforms the props with [mapper]
ComponentEnhancer<ReduxProps<State, StateBuilder, Actions>, OutterP> mapReduxStoreToProps<
        State extends BuiltReducer<State, StateBuilder>,
        StateBuilder extends Builder<State, StateBuilder>,
        Actions extends ReduxActions,
        OutterP>(PropMapper<ReduxProps<State, StateBuilder, Actions>, OutterP> mapper) =>
    (FunctionalComponent<OutterP> baseComponent) =>
        (ReduxProps<State, StateBuilder, Actions> props) => (ReduxStore()
          ..reduxProps = props
          ..mapper = mapper
          ..baseComponent = baseComponent)();
