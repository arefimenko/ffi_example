cmake_minimum_required(VERSION 3.10)
project(calculator LANGUAGES CXX C)
add_library(calculator SHARED calculator.cpp)
add_executable(calculator_test calculator.cpp)

set(CMAKE_BUILD_TYPE Release)