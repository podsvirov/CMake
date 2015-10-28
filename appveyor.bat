setlocal

mkdir Build
cd Build

echo CMake Configuration

set QTIFWDIR=C:/Qt/QtIFW2.0.1
cmake -G "%generator%" -DBUILD_TESTING:BOOL=OFF -DCMAKE_PREFIX_PATH:PATH="%qtdir%" -DBUILD_QtDialog:BOOL=TRUE -DCMake_GUI_DISTRIBUTE_WITH_Qt_LGPL:BOOL=TRUE -DCPACK_GENERATOR:STRING=IFW -DCMake_INSTALL_COMPONENTS:BOOL=TRUE -DCMake_INSTALL_DEPENDENCIES:BOOL=TRUE -DCPACK_DOWNLOAD_ALL:BOOL=TRUE -DCPACK_DOWNLOAD_SITE:STRING=http://ifw.podsvirov.pro/cmake/repo/master/windows/win%bits% -DCPACK_IFW_PACKAGE_START_MENU_DIRECTORY:STRING="CMake Master (%platform%)" -DCPACK_PACKAGE_FILE_NAME:STRING=cmake-master-win%bits%-online ..

echo CMake Packaging

msbuild PACKAGE.vcxproj /p:Platform=%vcplatform% /p:Configuration=%configuration% /logger:"C:\Program Files\AppVeyor\BuildAgent\Appveyor.MSBuildLogger.dll" || goto error
goto :EOF

:error
echo Failed!
EXIT /b %ERRORLEVEL%
