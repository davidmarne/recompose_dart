import 'dart:html';

import 'package:over_react/over_react.dart';
import 'package:react/react_dom.dart';

import './with_ref.dart';
import '../typedefs/typedefs.dart';

@Factory()
UiFactory<WithRefProps> WithRef;

@Props()
class WithRefProps<E extends Element, P extends RefProp<E>> extends UiProps {
  P baseProps;
  FunctionalComponent<P> baseComponent;
}

@Component()
class WithRefComponent<E extends Element, P extends RefProp<E>>
    extends UiComponent<WithRefProps<E, P>> {
  P get baseProps => props.baseProps;

  @override
  componentDidMount() {
    super.componentWillMount();
    redraw();
  }

  buildProps() => props.baseProps..ref = findDOMNode(this).children.first;

  render() => props.baseComponent(buildProps());
}
