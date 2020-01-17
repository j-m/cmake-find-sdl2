FIND_PATH(SDL2_TTF_INCLUDE_DIR SDL_ttf.h
  HINTS ${LIBS}/SDL2_ttf
  PATH_SUFFIXES include/SDL2 include SDL2 i686-w64-mingw32/include/SDL2 x86_64-w64-mingw32/include/SDL2
  PATHS ~/Library/Frameworks /Library/Frameworks /usr/local/include/SDL2 /usr/include/SDL2 /opt
)

GET_FILENAME_COMPONENT(SDL2_TTF_DIR ${SDL2_TTF_INCLUDE_DIR} DIRECTORY)

IF(CMAKE_SIZEOF_VOID_P EQUAL 8)
  FIND_LIBRARY(SDL2_TTF_LIBRARY_TEMP
    NAMES SDL2_ttf
    HINTS ${LIBS}/SDL2_ttf
    PATH_SUFFIXES lib64 lib lib/x64 x86_64-w64-mingw32/lib
    PATHS /sw /opt/local /opt/csw /opt
  )
ELSE(CMAKE_SIZEOF_VOID_P EQUAL 8)
  FIND_LIBRARY(SDL2_TTF_LIBRARY_TEMP
    NAMES SDL2_ttf
    HINTS ${LIBS}/SDL2_ttf
    PATH_SUFFIXES lib lib/x86 i686-w64-mingw32/lib
    PATHS /sw /opt/local /opt/csw /opt
  )
ENDIF(CMAKE_SIZEOF_VOID_P EQUAL 8)

IF(SDL2_TTF_LIBRARY_TEMP)
  SET(SDL2_TTF_LIBRARY ${SDL2_TTF_LIBRARY_TEMP} CACHE STRING "Where the SDL2_ttf Library can be found")
  SET(SDL2_TTF_LIBRARY_TEMP ${SDL2_TTF_LIBRARY_TEMP} CACHE INTERNAL "")
ELSE(SDL2_TTF_LIBRARY_TEMP)
  MESSAGE(FATAL_ERROR "Could not find the libs for SDL2_ttf. Make sure the library folders have the correct names. SDL2_TTF_LIBRARY_TEMP was not set.")
ENDIF(SDL2_TTF_LIBRARY_TEMP)

INCLUDE(FindPackageHandleStandardArgs)

FIND_PACKAGE_HANDLE_STANDARD_ARGS(SDL2_TTF REQUIRED_VARS SDL2_TTF_LIBRARY SDL2_TTF_INCLUDE_DIR)