//
// Created by Artyom Efimenko on 06.12.2022.
//

#ifndef FFI_EXAMPLE_DATE_TIME_H
#define FFI_EXAMPLE_DATE_TIME_H

#include <iostream>

#ifdef __cplusplus
extern "C" {
#endif

/// Day values for each month.
const int monthDays[] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

/// DateTime base struct.
///
/// Contains year, month and day to present day value.
struct DateTime {
    int year;
    int month;
    int day;
};

/// Creates DateTime with 2023 New Year date.
DateTime *createNewYear();

/// Change year of passed DateTime.
///
/// \param time - pointer to DateTime struct.
/// \param year - new year value.
///
/// \throws std::invalid_argument - if year less than 1.
void changeYear(DateTime *time, int year);

/// Change month of passed DateTime.
///
/// \param time - pointer to DateTime struct.
/// \param month - new month value.
///
/// \throws std::invalid_argument - if month less than 1 or greater than 12.
void changeMonth(DateTime *time, int month);

/// Change day of passed DateTime.
///
/// \param time - pointer to DateTime struct.
/// \param day - new day value.
///
/// \throws std::invalid_argument - if day less than 1 or greater than possible for [time->month] days.
void changeDay(DateTime *time, int day);

#ifdef __cplusplus
}
#endif

#endif //FFI_EXAMPLE_DATE_TIME_H
