import 'lifecycle_component.dart' show LifeCycle;
import '../typedefs/typedefs.dart';

typedef void ComponentWillMount<P>(P props);
typedef void ComponentDidMount<P>(P props);
typedef void ComponentWillReceiveProps<P>(P props, P nextProps);
typedef bool ShouldComponentUpdate<P>(P props, P nextProps);
typedef void ComponentWillUpdate<P>(P props, P nextProps);
typedef void ComponentDidUpdate<P>(P prevProps, P props);
typedef void ComponentWillUnmount<P>(P props);
typedef P GetDefaultProps<P>();

/// [lifecycle] will call the react lifecycle functions provided.
///
/// Example
///  ```dart
///   class LifeCycleProps {
///     String onMountMessage;
///     String onUpdateMessage;
///   }
///
///   // The props will be transformed from ExampleProps to MappedExampleProps and the
///   // component will be wrapped with a pure should component update.
///   FunctionalComponent<ExampleProps> lifeCycleLogger = lifecycle<LifeCycleProps>(
///     componentWillMount: (props) => print(props.onMountMessage),
///     componentDidUpdate: (prevProps, props) => print(props.onUpdateMessage),
///   )
///
///   FunctionalComponent<MappedExampleProps> lifeCycleLogger(LifeCycleProps props) => Dom.div()();
///   ```
lifecycle<P>({
  ComponentWillMount<P> componentWillMount,
  ComponentDidMount<P> componentDidMount,
  ComponentWillReceiveProps<P> componentWillReceiveProps,
  ShouldComponentUpdate<P> shouldComponentUpdate,
  ComponentWillUpdate<P> componentWillUpdate,
  ComponentDidUpdate<P> componentDidUpdate,
  ComponentWillUnmount<P> componentWillUnmount,
  GetDefaultProps<P> getDefaultProps,
}) =>
    (FunctionalComponent<P> baseComponent) => (P props) => (LifeCycle()
      ..componentWillMount = componentWillMount
      ..componentDidMount = componentDidMount
      ..componentWillReceiveProps = componentWillReceiveProps
      ..shouldComponentUpdate = shouldComponentUpdate
      ..componentWillUpdate = componentWillUpdate
      ..componentDidUpdate = componentDidUpdate
      ..componentWillUnmount = componentWillUnmount
      ..getDefaultProps = getDefaultProps
      ..baseProps = props
      ..baseComponent = baseComponent)();
