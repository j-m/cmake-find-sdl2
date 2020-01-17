FIND_PATH(SDL2_INCLUDE_DIR SDL.h
  HINTS ${LIBS}/SDL2
  PATH_SUFFIXES include/SDL2 include SDL2 i686-w64-mingw32/include/SDL2 x86_64-w64-mingw32/include/SDL2
  PATHS ~/Library/Frameworks /Library/Frameworks /usr/local/include/SDL2 /usr/include/SDL2 /opt
)

IF(CMAKE_SIZEOF_VOID_P EQUAL 8)
  FIND_LIBRARY(SDL2_LIBRARY
    NAMES SDL2
    HINTS ${LIBS}/SDL2
    PATH_SUFFIXES lib64 lib lib/x64 x86_64-w64-mingw32/lib
    PATHS /sw /opt/local /opt/csw /opt
  )
ELSE(CMAKE_SIZEOF_VOID_P EQUAL 8)
  FIND_LIBRARY(SDL2_LIBRARY
    NAMES SDL2
    HINTS ${LIBS}/SDL2
    PATH_SUFFIXES lib lib/x86 i686-w64-mingw32/lib
    PATHS /sw /opt/local /opt/csw /opt
  )
ENDIF(CMAKE_SIZEOF_VOID_P EQUAL 8)

IF(SDL2_LIBRARY)
  IF(NOT SDL2_BUILDING_LIBRARY)
    IF(SDL2MAIN_LIBRARY)
      IF(CMAKE_SIZEOF_VOID_P EQUAL 8)
        FIND_LIBRARY(SDL2MAIN_LIBRARY
          NAMES SDL2main
          HINTS ${LIBS}/SDL2
          PATH_SUFFIXES lib64 lib lib/x64 x86_64-w64-mingw32/lib
          PATHS /sw /opt/local /opt/csw /opt
        )
      ELSE(CMAKE_SIZEOF_VOID_P EQUAL 8)
        FIND_LIBRARY(SDL2MAIN_LIBRARY
          NAMES SDL2main
          HINTS ${LIBS}/SDL2
          PATH_SUFFIXES lib lib/x86 i686-w64-mingw32/lib
          PATHS /sw /opt/local /opt/csw /opt
        )
      ENDIF(CMAKE_SIZEOF_VOID_P EQUAL 8)
      SET(SDL2_LIBRARY ${SDL2MAIN_LIBRARY} ${SDL2_LIBRARY})
    ENDIF(SDL2MAIN_LIBRARY)
  ENDIF(NOT SDL2_BUILDING_LIBRARY)
  
  IF(APPLE)
    SET(SDL2_LIBRARY ${SDL2_LIBRARY} "-framework Cocoa")
  ELSE(APPLE)
    FIND_PACKAGE(Threads)
    SET(SDL2_LIBRARY ${SDL2_LIBRARY} ${CMAKE_THREAD_LIBS_INIT})
  ENDIF(APPLE)
  
  IF(MINGW)
    SET(MINGW32_LIBRARY mingw32 CACHE STRING "mwindows for MinGW")
    SET(SDL2_LIBRARY ${MINGW32_LIBRARY} ${SDL2_LIBRARY})
  ENDIF(MINGW)
  
ELSE(SDL2_LIBRARY)
  IF("${LIBS}" STREQUAL "")
	MESSAGE(FATAL_ERROR "Could not find the libs for SDL2. LIBS not set. Add a CMake variable called LIBS and set it to the parent directory of your SDL2 library folders. Required for Windows.")
  ELSE()
	MESSAGE(FATAL_ERROR "Could not find the libs for SDL2. Make sure the library folders have the correct names. LIBS was set to " ${LIBS})
  ENDIF()
ENDIF(SDL2_LIBRARY)

INCLUDE(FindPackageHandleStandardArgs)

FIND_PACKAGE_HANDLE_STANDARD_ARGS(SDL2 REQUIRED_VARS SDL2_LIBRARY SDL2_INCLUDE_DIR)
