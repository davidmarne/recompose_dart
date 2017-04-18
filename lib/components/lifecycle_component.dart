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
    super.componentWillMount();
    if (props.componentWillMount != null) props.componentWillMount(baseProps);
  }

  @override
  void componentDidMount() {
    super.componentDidMount();
    if (props.componentDidMount != null) props.componentDidMount(baseProps);
  }

  @override
  void componentWillReceiveProps(Map nextPropsMap) {
    var nextProps = typedPropsFactory(nextPropsMap);
    super.componentWillReceiveProps(nextProps);
    if (props.componentWillReceiveProps != null)
      props.componentWillReceiveProps(baseProps, nextProps.baseProps);
  }

  @override
  bool shouldComponentUpdate(Map nextPropsMap, _) {
    var nextProps = typedPropsFactory(nextPropsMap);
    if (props.shouldComponentUpdate != null)
      return props.shouldComponentUpdate(baseProps, nextProps.baseProps);
    return true;
  }

  @override
  void componentWillUpdate(Map nextPropsMap, _) {
    var nextProps = typedPropsFactory(nextPropsMap);
    super.componentWillUpdate(nextProps, _);
    if (props.componentWillUpdate != null)
      props.componentWillUpdate(baseProps, nextProps.baseProps);
  }

  @override
  void componentDidUpdate(Map prevPropsMap, _) {
    var prevProps = typedPropsFactory(prevPropsMap);
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
