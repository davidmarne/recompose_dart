import 'package:over_react/over_react.dart';
import './lifecycle.dart';
import '../typedefs/typedefs.dart';

@Factory()
UiFactory<LifeCycleProps> LifeCycle;

@Props()
class LifeCycleProps<P> extends UiProps {
  ComponentWillMount<P> componentWillMount;
  ComponentDidMount<P> componentDidMount;
  ComponentWillReceiveProps<P> componentWillReceiveProps;
  ShouldComponentUpdate<P> shouldComponentUpdate;
  ComponentWillUpdate<P> componentWillUpdate;
  ComponentDidUpdate<P> componentDidUpdate;
  ComponentWillUnmount<P> componentWillUnmount;
  GetDefaultProps<P> getDefaultProps;
  P baseProps;
  FunctionalComponent<P> baseComponent;
}

@Component()
class LifeCycleComponent<P> extends UiComponent<LifeCycleProps<P>> {
  P get baseProps => props.baseProps;

  @override
  void componentWillMount() {
    print(baseProps);
    super.componentWillMount();
    if (props.componentWillMount != null) props.componentWillMount(baseProps);
  }

  @override
  void componentDidMount() {
    super.componentDidMount();
    if (props.componentDidMount != null) props.componentDidMount(baseProps);
  }

  @override
  void componentWillReceiveProps(LifeCycleProps<P> newProps) {
    super.componentWillReceiveProps(newProps);
    if (props.componentWillReceiveProps != null) props.componentWillReceiveProps(baseProps, newProps.baseProps);
  }

  @override
  bool shouldComponentUpdate(LifeCycleProps<P> nextProps, _) {
    if (props.componentWillReceiveProps != null) return props.shouldComponentUpdate(baseProps, nextProps.baseProps);
    return true;
  }

  @override
  void componentWillUpdate(LifeCycleProps<P> nextProps, _) {
    super.componentWillUpdate(nextProps, _);
    if (props.componentWillUpdate != null) props.componentWillUpdate(baseProps, nextProps.baseProps);
  }

  @override
  void componentDidUpdate(LifeCycleProps<P> prevProps, _) {
    super.componentDidUpdate(prevProps, _);
    if (props.componentDidUpdate != null) props.componentDidUpdate(prevProps.baseProps, baseProps);
  }

  @override
  void componentWillUnmount() {
    super.componentWillUnmount();
    if (props.componentWillUnmount != null) props.componentWillUnmount(baseProps);
  }

  render() => props.baseComponent(baseProps);
}
