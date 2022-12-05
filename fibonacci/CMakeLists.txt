cmake_minimum_required(VERSION 3.10)
project(fibonacci LANGUAGES CXX C)
add_library(fibonacci SHARED fibonacci.cpp)
add_executable(fibonacci_test fibonacci.cpp)

set(CMAKE_BUILD_TYPE Release)