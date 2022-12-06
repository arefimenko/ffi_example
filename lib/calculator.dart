import 'dart:ffi' as ffi;
import 'dart:io' show Directory, stdout;

import 'package:meta/meta.dart';
import 'package:path/path.dart' as path;

typedef _NativeCalcAction = ffi.Void Function(ffi.Pointer<_NativeCalc>, ffi.Int32);
typedef _CalcAction = void Function(ffi.Pointer<_NativeCalc>, int);
typedef _NativeCalcResCallback = ffi.Void Function(ffi.Int32);
typedef _NativeCalcPointerFunc = ffi.Pointer<ffi.NativeFunction<_NativeCalcResCallback>>;

class _NativeCalc extends ffi.Opaque {}

@immutable
class Calculator {
  late final ffi.Pointer<_NativeCalc> _nativeCalc;
  late final _CalcAction _add;
  late final _CalcAction _subtract;
  late final _CalcAction _divide;
  late final _CalcAction _multiply;

  Calculator([int initial = 0]) {
    final calcLib = ffi.DynamicLibrary.open(
      path.join(Directory.current.path, 'calculator', 'libcalculator.dylib'),
    );
    final resultCallback = ffi.Pointer.fromFunction<_NativeCalcResCallback>(_resultCallback);
    final createCalc = calcLib.lookupFunction<
        ffi.Pointer<_NativeCalc> Function(ffi.Int32, _NativeCalcPointerFunc),
        ffi.Pointer<_NativeCalc> Function(int, _NativeCalcPointerFunc)>(
      'createCalcWithInitialValue',
    );
    _nativeCalc = createCalc(initial, resultCallback);
    _add = calcLib.lookupFunction<_NativeCalcAction, _CalcAction>('add');
    _subtract = calcLib.lookupFunction<_NativeCalcAction, _CalcAction>('subtract');
    _divide = calcLib.lookupFunction<_NativeCalcAction, _CalcAction>('divide');
    _multiply = calcLib.lookupFunction<_NativeCalcAction, _CalcAction>('multiply');
  }

  void add(int a) => _add(_nativeCalc, a);

  void subtract(int a) => _subtract(_nativeCalc, a);

  void divide(int a) => _divide(_nativeCalc, a);

  void multiply(int a) => _multiply(_nativeCalc, a);

  static void _resultCallback(int a) => stdout.writeln('calc result: $a');
}
