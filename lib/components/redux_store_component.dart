import 'dart:async';

import 'package:built_redux/built_redux.dart';
import 'package:over_react/over_react.dart';

import '../typedefs/typedefs.dart';
import './redux_store_connect.dart';

@Factory()
UiFactory<ReduxStoreProps> ReduxStore;

@Props()
class ReduxStoreProps<P, S extends BuiltReducer> extends UiProps {
  ReduxProps<S> reduxProps;
  PropMapper<ReduxProps<S>, P> mapper;
  FunctionalComponent<P> baseComponent;
}

@Component()
class ReduxStoreComponent<P, S extends BuiltReducer> extends UiComponent<ReduxStoreProps<P, S>> {
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
