//
// Created by Artyom Efimenko on 06.12.2022.
//

#include "date_time.h"

DateTime *createNewYear() {
    DateTime *dateTime = new DateTime();
    dateTime->year = 2023;
    dateTime->month = 1;
    dateTime->day = 1;
    return dateTime;
}

void changeYear(DateTime *time, int year) {
    if (year < 1) { throw std::invalid_argument("invalid year value"); }
    time->year = year;
}

void changeMonth(DateTime *time, int month) {
    if (month < 1 || month > 12) { throw std::invalid_argument("invalid month value"); }
    time->month = month;
}

void changeDay(DateTime *time, int day) {
    if (day < 1 || day > monthDays[time->month]) {
        throw std::invalid_argument("invalid day value");
    }
    time->day = day;
}

int main() {
    DateTime *dateTime = createNewYear();
    changeYear(dateTime, 2024);
    changeMonth(dateTime, 6);
    changeDay(dateTime, 17);
    std::cout << dateTime->year << std::endl;
    std::cout << dateTime->month << std::endl;
    std::cout << dateTime->day << std::endl;
    return 0;
}