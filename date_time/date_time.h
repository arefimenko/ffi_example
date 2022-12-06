//
// Created by Artyom Efimenko on 06.12.2022.
//

#ifndef FFI_EXAMPLE_DATE_TIME_H
#define FFI_EXAMPLE_DATE_TIME_H

#include <iostream>

const int monthDays[] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

struct DateTime {
    int year;
    int month;
    int day;
};

DateTime *createNewYear();

void changeYear(DateTime *time, int year);

void changeMonth(DateTime *time, int month);

void changeDay(DateTime *time, int day);


#endif //FFI_EXAMPLE_DATE_TIME_H
