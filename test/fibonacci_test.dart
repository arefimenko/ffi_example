import 'dart:io';

import 'package:ffi_example/fibonacci.dart';
import 'package:test/test.dart';

void main() {
  group('Fibonacci cpp lib', () {
    test('make dylib and execute test file', () async {
      final cmake = await Process.run('cmake', ['.'], workingDirectory: 'fibonacci');
      expect(cmake.exitCode, 0);

      final make = await Process.run('make', [], workingDirectory: 'fibonacci');
      expect(make.exitCode, 0);
    });

    test('execute Fibonacci test file', () async {
      final test = await Process.run('./fibonacci_test', [], workingDirectory: 'fibonacci');
      expect(test.exitCode, 0);
      expect(test.stderr, isEmpty);
      expect(test.stdout, equals('recursive(15) == 610\nlinear(21) == 10946\n'));
    });
  });

  group('linear Fibonacci execution', () {
    late final fibonacci = Fibonacci();

    test(
      'dart side calculation for n == 11',
      () => expect(fibonacci.linear(11), equals(89)),
    );

    test(
      'native side calculation for n == 12',
      () => expect(fibonacci.linearNative(12), equals(144)),
    );
  });

  group('recursive Fibonacci execution', () {
    late final fibonacci = Fibonacci();

    test(
      'dart side calculation for n == 11',
      () => expect(fibonacci.recursive(11), equals(89)),
    );

    test(
      'native side calculation for n == 12',
      () => expect(fibonacci.recursiveNative(12), equals(144)),
    );
  });
}
