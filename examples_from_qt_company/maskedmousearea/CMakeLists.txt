cmake_minimum_required(VERSION 3.14)

project(maskedmousearea LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)


find_package(QT NAMES Qt6 Qt5 COMPONENTS Core Quick Qml Gui REQUIRED)
find_package(Qt${QT_VERSION_MAJOR} COMPONENTS Core Quick Qml Gui REQUIRED)

set(PROJECT_SOURCES
        main.cpp
        maskedmousearea.cpp
        maskedmousearea.h
        qml.qrc
)

if(${QT_VERSION_MAJOR} GREATER_EQUAL 6)
    qt_add_executable(maskedmousearea
        ${PROJECT_SOURCES}
    )
else()
    if(ANDROID)
        add_library(maskedmousearea SHARED
            ${PROJECT_SOURCES}
        )
    else()
        add_executable(maskedmousearea
          ${PROJECT_SOURCES}
        )
    endif()
endif()

target_compile_definitions(maskedmousearea
  PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(maskedmousearea
  PRIVATE Qt${QT_VERSION_MAJOR}::Core Qt${QT_VERSION_MAJOR}::Quick
  Qt${QT_VERSION_MAJOR}::Qml Qt${QT_VERSION_MAJOR}::Gui)


set_target_properties(maskedmousearea PROPERTIES
    QT_QML_MODULE_VERSION 1.0
    QT_QML_MODULE_URI Example)

qt6_qml_type_registration(maskedmousearea)
