cmake_minimum_required(VERSION 3.16)

project(PreventQuitQML VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS Core Quick)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Quick)

if(${QT_VERSION_MAJOR} GREATER_EQUAL 6)
    qt_standard_project_setup(REQUIRES 6.5)

    qt_add_executable(appPreventQuitQML
        main.cpp
    )

    qt_add_qml_module(appPreventQuitQML
        URI PreventQuitQML
        VERSION 1.0
        QML_FILES
            Main.qml
    )

    # Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
    # If you are developing for iOS or macOS you should consider setting an
    # explicit, fixed bundle identifier manually though.
    set_target_properties(appPreventQuitQML PROPERTIES
    #    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appPreventQuitQML
        MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
        MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
        MACOSX_BUNDLE TRUE
        WIN32_EXECUTABLE TRUE
    )
else()
    add_executable(appPreventQuitQML
        main.cpp
        qml.qrc
    )
endif()

target_link_libraries(appPreventQuitQML
    PRIVATE Qt${QT_VERSION_MAJOR}::Quick
)

include(GNUInstallDirs)
install(TARGETS appPreventQuitQML
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
