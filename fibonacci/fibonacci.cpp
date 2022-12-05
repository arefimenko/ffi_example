//
// Created by Artyom Efimenko on 05.12.2022.
//

#include <iostream>

#include "fibonacci.h"

int fibonacci(int n) {
    if (n == 0) return 0;
    if (n == 1) return 1;
    return fibonacci(n - 1) + fibonacci(n - 2);
}

int main() {
    std::cout << "fibonacci(15) == " << fibonacci(15) << std::endl;
    return 0;
}