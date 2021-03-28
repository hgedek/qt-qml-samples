cmake_minimum_required(VERSION 3.14)

project(textballoon LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(QT NAMES Qt6 Qt5 COMPONENTS Core Quick REQUIRED)
find_package(Qt${QT_VERSION_MAJOR} COMPONENTS Core Quick REQUIRED)

qt6_add_qml_module(textballoon
    OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/TextBalloonPlugin"
    VERSION 1.0
    URI "TextBalloonPlugin"
    INSTALL_LOCATION "${CMAKE_CURRENT_BINARY_DIR}/install/TextBalloonPlugin"
    )

target_sources(textballoon PRIVATE
    plugin.h
    textballoon.cpp
    textballoon.h
    qml.qrc)

set_target_properties(textballoon PROPERTIES
    MACOSX_BUNDLE TRUE)

set(textballoon_resource_files
    "textballoon.h"
    "main.qml")

qt6_add_resources(textballoon "painteditem"
    PREFIX "/painteditem"
    FILES ${textballoon_resource_files})

target_compile_definitions(textballoon
  PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(textballoon
  PRIVATE Qt${QT_VERSION_MAJOR}::Core Qt${QT_VERSION_MAJOR}::Quick)

set_target_properties(textballoon PROPERTIES
    QT_QML_MODULE_VERSION 1.0
    QT_QML_MODULE_URI TextBalloonPlugin)

qt6_qml_type_registration(textballoon)
