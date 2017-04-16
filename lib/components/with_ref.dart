import 'dart:html';
import '../typedefs/typedefs.dart';
import './with_ref_component.dart' show WithRef;

class RefProp<E extends Element> {
  E ref;
}

/// [withRef] with pass a ref to the dom element to [baseComponent]
ComponentEnhancer<P, P> withRef<E extends Element, P extends RefProp<E>>(
        Map<String, dynamic> defaultState) =>
    (FunctionalComponent<P> baseComponent) => (P props) => (WithRef()
      ..baseProps = props
      ..baseComponent = baseComponent)();
