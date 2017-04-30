import '../typedefs/typedefs.dart';
import './with_state_component.dart' show WithState;

typedef StateSetter(Map<String, dynamic> newState);

class StateMgr {
  Map<String, dynamic> state;
  StateSetter setState;
}

/// withState will pass your component a [state] object and [setState] function
ComponentEnhancer<P, P> withState<P extends StateMgr>(Map<dynamic, dynamic> defaultState) =>
    (FunctionalComponent<P> baseComponent) => (P props) => (WithState()
      ..defaultState = defaultState
      ..baseProps = props
      ..baseComponent = baseComponent)();
