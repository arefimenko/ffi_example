import 'dart:ffi' as ffi;
import 'dart:io' show Directory, stdout;

import 'package:ffi_example/calculator.dart';
import 'package:ffi_example/fibonacci.dart';
import 'package:ffi_example/native_date_time.dart';
import 'package:path/path.dart' as path;

void main() {
  executeNativeFibonacci();
  executeNativeDateTime();
  executeNativeCalculator();
}

void executeNativeFibonacci() {
  stdout.writeln('-------- Native Fibonacci --------');
  Fibonacci().executeAllFor(32);
}

void executeNativeDateTime() {
  stdout.writeln('\n-------- Native DateTime --------');
  final nativeDateTimeLib = ffi.DynamicLibrary.open(
    path.join(Directory.current.path, 'date_time', 'libdate_time.dylib'),
  );
  final nativeDateTime = NativeDateTime(nativeDateTimeLib);
  final dateTimePointer = nativeDateTime.createNewYear();
  final dateTime = dateTimePointer.ref;
  stdout.writeln('year: ${dateTime.year}, month: ${dateTime.month}, day: ${dateTime.day}');
  nativeDateTime.changeDay(dateTimePointer, 15);
  stdout.writeln('year: ${dateTime.year}, month: ${dateTime.month}, day: ${dateTime.day}');
  dateTime.month = 5;
  stdout.writeln('year: ${dateTime.year}, month: ${dateTime.month}, day: ${dateTime.day}');
}

void executeNativeCalculator() {
  stdout.writeln('\n-------- Native Calculator --------');
  Calculator()
    ..add(15)
    ..multiply(2)
    ..divide(10)
    ..subtract(7);
}
