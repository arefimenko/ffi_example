//
// Created by Artyom Efimenko on 05.12.2022.
//

#include <iostream>

#include "fibonacci.h"

int linearFibonacci(int n) {
    if (n == 0) return 0;
    if (n == 1) return 1;
    return linearFibonacci(n - 1) + linearFibonacci(n - 2);
}

int recursiveFibonacci(int n) {
    int n0 = 0, n1 = 1, aux;

    for (int i = 0; i < n; i++) {
        aux = n0;
        n0 = n1;
        n1 += aux;
    }

    return n0;
}

int main() {
    std::cout << "linearFibonacci(15) == " << linearFibonacci(15) << std::endl;
    std::cout << "recursiveFibonacci(21) == " << recursiveFibonacci(21) << std::endl;
    return 0;
}