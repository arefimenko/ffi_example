import 'dart:ffi' as ffi;
import 'dart:io' show Directory, Process;

import 'package:ffi_example/native_date_time.dart';
import 'package:path/path.dart' as path;
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

  group('Work with native DateTime implementation', () {
    late final NativeDateTime nativeDateTime;

    setUpAll(() {
      final dateTimeLib = ffi.DynamicLibrary.open(
        path.join(Directory.current.path, 'date_time', 'libdate_time.dylib'),
      );
      nativeDateTime = NativeDateTime(dateTimeLib);
    });

    test('Create pointer to native DateTime', () {
      final pointer = nativeDateTime.createNewYear();
      final dateTimeRef = pointer.ref;
      expect(pointer, isNotNull);
      expect(pointer, isA<ffi.Pointer<DateTime>>());
      expect(dateTimeRef, isA<DateTime>());
      expect(dateTimeRef.year, equals(2023));
      expect(dateTimeRef.month, equals(1));
      expect(dateTimeRef.day, equals(1));
    });

    test('Create native DateTime and update year via func', () {
      final pointer = nativeDateTime.createNewYear();
      final dateTimeRef = pointer.ref;
      nativeDateTime.changeYear(pointer, 2024);
      expect(dateTimeRef.year, equals(2024));
      expect(dateTimeRef.month, equals(1));
      expect(dateTimeRef.day, equals(1));
    });

    test('Create native DateTime and update month via func', () {
      final pointer = nativeDateTime.createNewYear();
      final dateTimeRef = pointer.ref;
      nativeDateTime.changeMonth(pointer, 6);
      expect(dateTimeRef.year, equals(2023));
      expect(dateTimeRef.month, equals(6));
      expect(dateTimeRef.day, equals(1));
    });

    test('Create native DateTime and update day via func', () {
      final pointer = nativeDateTime.createNewYear();
      final dateTimeRef = pointer.ref;
      nativeDateTime.changeDay(pointer, 11);
      expect(dateTimeRef.year, equals(2023));
      expect(dateTimeRef.month, equals(1));
      expect(dateTimeRef.day, equals(11));
    });

    test('Create native DateTime and update year via reference', () {
      final pointer = nativeDateTime.createNewYear();
      final dateTimeRef = pointer.ref..year = 2024;
      expect(dateTimeRef.year, equals(2024));
      expect(dateTimeRef.month, equals(1));
      expect(dateTimeRef.day, equals(1));
    });

    test('Create native DateTime and update month via reference', () {
      final pointer = nativeDateTime.createNewYear();
      final dateTimeRef = pointer.ref..month = 6;
      expect(dateTimeRef.year, equals(2023));
      expect(dateTimeRef.month, equals(6));
      expect(dateTimeRef.day, equals(1));
    });

    test('Create native DateTime and update day via reference', () {
      final pointer = nativeDateTime.createNewYear();
      final dateTimeRef = pointer.ref..day = 11;
      expect(dateTimeRef.year, equals(2023));
      expect(dateTimeRef.month, equals(1));
      expect(dateTimeRef.day, equals(11));
    });
  });
}
