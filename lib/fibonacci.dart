import 'dart:ffi' as ffi;
import 'dart:io' show Directory;
import 'package:path/path.dart' as path;

typedef _NativeFibonacci = ffi.Int32 Function(ffi.Int32);
typedef _DartFibonacci = int Function(int);

/// Fibonacci sequence Dart FFI example
class Fibonacci {
  late final _DartFibonacci _linearNative;
  late final _DartFibonacci _recursiveNative;

  Fibonacci() {
    // TODO(arefimenko): port to Linux/Windows OS.
    final cppLib = ffi.DynamicLibrary.open(
      path.join(Directory.current.path, 'fibonacci', 'libfibonacci.dylib'),
    );
    _linearNative = cppLib.lookupFunction<_NativeFibonacci, _DartFibonacci>('linear');
    _recursiveNative = cppLib
        .lookup<ffi.NativeFunction<_NativeFibonacci>>('recursive')
        .asFunction<_DartFibonacci>();
  }

  /// Recursive Fibonacci sequence execution.
  int recursive(int n) {
    if (n == 0) return 0;
    if (n == 1) return 1;
    return recursive(n - 1) + recursive(n - 2);
  }

  /// Recursive Fibonacci sequence native execution.
  int recursiveNative(int n) => _recursiveNative(n);

  /// Linear Fibonacci sequence execution.
  int linear(int n) {
    var n0 = 0;
    var n1 = 1;
    int aux;

    for (var i = 0; i < n; i++) {
      aux = n0;
      n0 = n1;
      n1 += aux;
    }

    return n0;
  }

  /// Linear Fibonacci sequence native execution.
  int linearNative(int n) => _linearNative(n);
}
