import 'package:over_react/over_react.dart';

import './with_ref.dart';
import '../typedefs/typedefs.dart';

@Factory()
UiFactory<WithRefProps> WithRef;

@Props()
class WithRefProps<P extends RefProp> extends UiProps {
  P baseProps;
  FunctionalComponent<P> baseComponent;
}

@Component()
class WithRefComponent<P extends RefProp> extends UiComponent<WithRefProps<P>> {
  P get baseProps => props.baseProps;

  @override
  componentDidMount() {
    super.componentWillMount();
    redraw();
  }

  buildProps() => props.baseProps..ref = this.ref;

  render() => props.baseComponent(buildProps());
}
