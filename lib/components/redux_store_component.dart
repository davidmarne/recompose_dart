import 'dart:async';

import 'package:built_redux/built_redux.dart';
import 'package:built_value/built_value.dart';
import 'package:over_react/over_react.dart';

import '../typedefs/typedefs.dart';
import './redux_store_connect.dart';

@Factory()
UiFactory<ReduxStoreProps> ReduxStore;

@Props()
class ReduxStoreProps<P, S extends BuiltReducer<S, B>, B extends Builder<S, B>,
    A extends ReduxActions> extends UiProps {
  ReduxProps<S, B, A> reduxProps;
  PropMapper<ReduxProps<S, B, A>, P> mapper;
  FunctionalComponent<P> baseComponent;
}

@Component()
class ReduxStoreComponent<P, S extends BuiltReducer<S, B>, B extends Builder<S, B>,
    A extends ReduxActions> extends UiComponent<ReduxStoreProps<P, S, B, A>> {
  /// List of store subscriptions created when the component mounts.
  ///
  /// These subscriptions are canceled when the component is unmounted.
  StreamSubscription _subscription;

  void componentWillMount() {
    super.componentWillMount();
    _subscription = props.reduxProps.store.subscribe.listen((_) => redraw());
  }

  void componentWillUnmount() {
    super.componentWillUnmount();
    _subscription.cancel();
  }

  P propBuilder() => props.mapper(props.reduxProps);

  render() => props.baseComponent(propBuilder());
}
