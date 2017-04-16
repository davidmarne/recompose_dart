import 'package:w_flux/w_flux.dart';

import '../typedefs/typedefs.dart';
import 'w_flux_store_component.dart' show FluxStore;

class FluxProps<S extends Store, A> {
  S store;
  A actions;

  FluxProps([this.store, this.actions]);
}

/// Subscribes to the flux [store] and transforms the props with [mapper]
ComponentEnhancer<FluxProps<S, A>, OutterP> mapStoreToProps<S extends Store, A, OutterP>(
        PropMapper<FluxProps<S, A>, OutterP> mapper) =>
    (FunctionalComponent<OutterP> baseComponent) => (FluxProps<S, A> props) => (FluxStore()
      ..fluxProps = props
      ..mapper = mapper
      ..baseComponent = baseComponent)();
