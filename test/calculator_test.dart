import 'dart:io';

import 'package:test/test.dart';

void main() {
  group('Calculator cpp lib', () {
    test('make dylib', () async {
      final cmake = await Process.run('cmake', ['.'], workingDirectory: 'calculator');
      expect(cmake.exitCode, 0);

      final make = await Process.run('make', [], workingDirectory: 'calculator');
      expect(make.exitCode, 0);
    });

    test('execute calculator test file', () async {
      final test = await Process.run('./calculator_test', [], workingDirectory: 'calculator');
      expect(test.exitCode, 0);
      expect(test.stderr, isEmpty);
      expect(test.stdout, equals('15\n30\n3\n-4\n'));
    });
  });
}
