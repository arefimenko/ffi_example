//
// Created by Artyom Efimenko on 06.12.2022.
//

#include "calculator.h"

Calculator *createCalc(IntCallback callback) {
    return new Calculator(callback);
}

Calculator *createCalcWithInitialValue(int initial, IntCallback callback) {
    return new Calculator(initial, callback);
}

void add(Calculator *calc, int a) { calc->add(a); }

void subtract(Calculator *calc, int a) { calc->subtract(a); }

void divide(Calculator *calc, int a) { calc->divide(a); }

void multiply(Calculator *calc, int a) { calc->multiply(a); }

int getResult(Calculator *calc) { return calc->getResult(); }

void calculatorChanges(int a) {
    std::cout << a << std::endl;
}

int main() {
    Calculator *calc = createCalc(calculatorChanges);
    calc->add(15);
    calc->multiply(2);
    calc->divide(10);
    calc->subtract(7);
    return 0;
}