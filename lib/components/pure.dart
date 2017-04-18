import 'dart:mirrors';

import './lifecycle.dart';
import '../typedefs/typedefs.dart';

ComponentEnhancer<P, P> pure<P>(FunctionalComponent<P> baseComponent) => lifecycle<P>(
      shouldComponentUpdate: (currentProps, nextProps) => (currentProps != nextProps),
    )(baseComponent);

bool shallowEquals<T>(T o1, T o2) {
  final InstanceMirror instanceMirror = reflect(o1);
  final InstanceMirror instanceMirror2 = reflect(o2);
  final classMirror = instanceMirror.type;
  return classMirror.declarations.values
      .where(
        (dm) => dm is VariableMirror,
      )
      .every(
        (vm) => identical(
              instanceMirror.getField(vm.simpleName).reflectee,
              instanceMirror2.getField(vm.simpleName).reflectee,
            ),
      );
}
