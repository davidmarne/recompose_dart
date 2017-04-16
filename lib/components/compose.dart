import '../typedefs/typedefs.dart';

/// [compose] returns a [ComponentEnhancer] that will run each [ComponentEnhancer] in [factories]
/// on the baseComponent in order.
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
///   FunctionalComponent<ExampleProps> composedMessage<ExampleProps, MappedExampleProps> = compose([
///     withProps<ExampleProps, MappedExampleProps>((ExampleProps props) => new MappedExampleProps()..message='Hello $name');
///     pure,
///   ])(message);
///
///   FunctionalComponent<MappedExampleProps> message(MappedExampleProps, props) => Dom.h1()(props.message);
///
ComponentEnhancer<InnerP, OutterP> compose<InnerP, OutterP>(
        Iterable<ComponentEnhancer<dynamic, dynamic>> factories) =>
    factories.reduce(
      (composed, nextFactory) => (props) => composed(nextFactory(props)),
    );
