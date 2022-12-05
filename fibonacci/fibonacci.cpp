//
// Created by Artyom Efimenko on 05.12.2022.
//

#include <iostream>

#include "fibonacci.h"

int recursive(int n) {
    if (n == 0) return 0;
    if (n == 1) return 1;
    return linear(n - 1) + linear(n - 2);
}

int linear(int n) {
    int n0 = 0, n1 = 1, aux;

    for (int i = 0; i < n; i++) {
        aux = n0;
        n0 = n1;
        n1 += aux;
    }

    return n0;
}

int main() {
    std::cout << "recursive(15) == " << recursive(15) << std::endl;
    std::cout << "linear(21) == " << linear(21) << std::endl;
    return 0;
}