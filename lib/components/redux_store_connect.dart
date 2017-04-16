import 'package:built_redux/built_redux.dart';

import '../typedefs/typedefs.dart';
import 'redux_store_component.dart';

class ReduxProps<StateT extends BuiltReducer> {
  Store<StateT, dynamic> store;
  ReduxProps([this.store]);
}

/// Subscribes to the redux [store] and transforms the props with [mapper]
ComponentEnhancer<ReduxProps<S>, OutterP> mapReduxStoreToProps<S extends BuiltReducer, OutterP>(
        PropMapper<ReduxProps<S>, OutterP> mapper) =>
    (FunctionalComponent<OutterP> baseComponent) => (ReduxProps<S> props) => (ReduxStore()
      ..reduxProps = props
      ..mapper = mapper
      ..baseComponent = baseComponent)();
