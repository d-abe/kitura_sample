cmake_minimum_required(VERSION 3.4)
project(kitura_sample)

add_custom_target(
        COMMAND /Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin/swift build
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
        SOURCES Package.swift Packages Sources Tests)