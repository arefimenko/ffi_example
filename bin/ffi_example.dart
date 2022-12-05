import 'dart:io';

import 'package:ffi_example/fibonacci.dart';

void main() {
  final fibonacci = Fibonacci();
  stdout
    ..writeln('linear: ${fibonacci.linear(15)}')
    ..writeln('recursive: ${fibonacci.recursive(21)}');
}
