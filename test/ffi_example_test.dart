import 'dart:io';

import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

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
}
