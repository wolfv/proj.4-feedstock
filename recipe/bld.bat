mkdir build
cd build
cmake -G "%CMAKE_GENERATOR%" .. -DCMAKE_BUILD_TYPE=Release -DBUILD_LIBPROJ_SHARED="ON" -DCMAKE_C_FLAGS="/WX" -DCMAKE_CXX_FLAGS="/WX" -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%"
cmake --build . --config Release --target install
cd ..
copy /Y data\* %LIBRARY_PREFIX%\\share\\proj


if errorlevel 1 exit 1

set ACTIVATE_DIR=%PREFIX%\etc\conda\activate.d
set DEACTIVATE_DIR=%PREFIX%\etc\conda\deactivate.d
mkdir %ACTIVATE_DIR%
mkdir %DEACTIVATE_DIR%

copy %RECIPE_DIR%\scripts\activate.bat %ACTIVATE_DIR%\proj4-activate.bat
if errorlevel 1 exit 1

copy %RECIPE_DIR%\scripts\deactivate.bat %DEACTIVATE_DIR%\proj4-deactivate.bat
if errorlevel 1 exit 1
