import 'dart:io';

import 'package:test/test.dart';

void main() {
  group('DateTime cpp lib', () {
    test('make dylib and execute test file', () async {
      final cmake = await Process.run('cmake', ['.'], workingDirectory: 'date_time');
      expect(cmake.exitCode, 0);

      final make = await Process.run('make', [], workingDirectory: 'date_time');
      expect(make.exitCode, 0);
    });

    test('execute date_time test file', () async {
      final test = await Process.run('./date_time_test', [], workingDirectory: 'date_time');
      expect(test.exitCode, 0);
      expect(test.stderr, isEmpty);
      expect(test.stdout, equals('2024\n6\n17\n'));
    });
  });
}
