import 'dart:async';

import 'package:over_react/over_react.dart';
import 'package:w_flux/w_flux.dart';

import '../typedefs/typedefs.dart';
import './w_flux_store_connect.dart';

@Factory()
UiFactory<FluxStoreProps> FluxStore;

@Props()
class FluxStoreProps<P, S extends Store, A> extends UiProps {
  FluxProps<S, A> fluxProps;
  PropMapper<FluxProps, P> mapper;
  FunctionalComponent<P> baseComponent;
}

@Component()
class FluxStoreComponent<P, S extends Store, A> extends UiComponent<FluxStoreProps<P, S, A>> with BatchedRedraws {
  /// List of store subscriptions created when the component mounts.
  ///
  /// These subscriptions are canceled when the component is unmounted.
  StreamSubscription _subscription;

  void componentWillMount() {
    super.componentWillMount();
    _subscription = props.fluxProps.store.listen((_) => redraw());
  }

  void componentWillUnmount() {
    super.componentWillUnmount();
    _subscription.cancel();
  }

  P propBuilder() => props.mapper(props.fluxProps);

  render() => props.baseComponent(propBuilder());
}
