/// Fibonacci sequence Dart FFI example
class Fibonacci {
  /// Recursive Fibonacci sequence execution.
  int recursive(int n) {
    if (n == 0) return 0;
    if (n == 1) return 1;
    return recursive(n - 1) + recursive(n - 2);
  }

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
}
