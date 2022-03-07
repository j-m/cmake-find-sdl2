# cmake-find-sdl2
CMake find modules to locate SDL2 redistributables on Windows and Mac

## Instructions

Copy & paste the contents of this repo to your project.  
Rename line 2 of `CMakeLists.txt`.  
For each library you wish to add download the "Development libraries" to a common folder of libraries, i.e. `C:/dev/dist`.  

Use the following project structure:  
```
|-headers
|-resources
|-src
| \-main.cpp
\-CMakeLists.txt
```

## Supported Libraries

`SDL2` `SDL2_image` `SDL2_mixer` `SDL2_ttf`

## IDE Specifics

### VSCode

Install the `CMake Tools` extension (`ms-vscode.cmake-tools` formerly `vector-of-bool.cmake-tools`)  

`.vscode/settings.json`

```
...
"cmake.configureSettings": {
  "LIBS": "C:/dev/dist"
}
...
```


### Visual Studio

You should have a nice GUI. If you don't, copy & paste this and restart; it'll probably complain but it should show you something. 

`CMakeSettings.json`  
```
...
"configurations": [
  {
    "name": "x64-Debug",
    "generator": "Ninja",
    "configurationType": "Debug",
    "inheritEnvironments": [ "clang_cl_x64" ],
    "buildRoot": "${projectDir}\\out\\build\\${name}",
    "installRoot": "${projectDir}\\out\\install\\${name}",
    "cmakeCommandArgs": "",
    "buildCommandArgs": "-v",
    "ctestCommandArgs": "",
    "variables": [
      {
        "name": "LIBS",
        "value": "C:/dev/dist/",
        "type": "PATH"
      }
    ]
  }
]
...
```
