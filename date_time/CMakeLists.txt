cmake_minimum_required(VERSION 3.10)
project(date_time LANGUAGES CXX C)
add_library(date_time SHARED date_time.cpp)
add_executable(date_time_test date_time.cpp)

set(CMAKE_BUILD_TYPE Release)