import './lifecycle.dart';
import '../typedefs/typedefs.dart';

FunctionalComponent<P> pure<P>(FunctionalComponent<P> baseComponent) => lifecycle<P>(
      shouldComponentUpdate: (currentProps, nextProps) => (currentProps != nextProps),
    )(baseComponent);
