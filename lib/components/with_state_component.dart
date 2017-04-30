import 'package:over_react/over_react.dart';

import './with_state.dart';
import '../typedefs/typedefs.dart';

@Factory()
UiFactory<WithStateProps> WithState;

@Props()
class WithStateProps<P extends StateMgr> extends UiProps {
  Map<dynamic, dynamic> defaultState;
  P baseProps;
  FunctionalComponent<P> baseComponent;
}

@Component()
class WithStateComponent<P extends StateMgr> extends UiComponent<WithStateProps<P>> {
  P get baseProps => props.baseProps;

  @override
  getInitialState() => props.defaultState;

  mixInState() => props.baseProps
    ..state = state
    ..setState = setState;

  render() => props.baseComponent(mixInState());
}
