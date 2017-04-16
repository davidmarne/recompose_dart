import '../typedefs/typedefs.dart';

/// [mapProps] will transform the props with the [mapper] funtion provider before invokeing [baseComponent]
/// Example
///   class ExampleProps {
///     String name;
///   }
///
///   class MappedExampleProps {
///     String message;
///   }
///
///   // The props will be transformed from ExampleProps to MappedExampleProps and the
///   // component will be wrapped with a pure should component update.
///   FunctionalComponent<ExampleProps> mappedMessage<ExampleProps, MappedExampleProps> = withProps<ExampleProps, MappedExampleProps>(
///     (ExampleProps props) => new MappedExampleProps()..message='Hello $name',
///   )(message);
///
///   FunctionalComponent<MappedExampleProps> message(MappedExampleProps props) => Dom.h1()(props.message);
///

ComponentEnhancer<InnerP, OutterP> withProps<InnerP, OutterP>(PropMapper<InnerP, OutterP> mapper) =>
    (FunctionalComponent<OutterP> baseComponent) => (InnerP props) => baseComponent(mapper(props));
