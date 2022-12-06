import 'dart:ffi' as ffi;
import 'dart:io' show Directory, stdout;

import 'package:ffi_example/native_date_time.dart';
import 'package:path/path.dart' as path;

void main() {
  final nativeDateTimeLib = ffi.DynamicLibrary.open(
    path.join(Directory.current.path, 'date_time', 'libdate_time.dylib'),
  );
  final nativeDateTime = NativeDateTime(nativeDateTimeLib);
  final dateTimePointer = nativeDateTime.createNewYear();
  final dateTime = dateTimePointer.ref;
  stdout.writeln('year: ${dateTime.year}, month: ${dateTime.month}, day: ${dateTime.day}');
  nativeDateTime.changeDay(dateTimePointer, 32);
  stdout.writeln('year: ${dateTime.year}, month: ${dateTime.month}, day: ${dateTime.day}');
  dateTime.month = 5;
  stdout.writeln('year: ${dateTime.year}, month: ${dateTime.month}, day: ${dateTime.day}');
}
