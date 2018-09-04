:loop

if "%~1"=="" goto continue
pushd "%~1"

if not exist %~n1.yaml (
	dir /a-d/b "*.tif" >%temp%\%~n1.yaml
	move %temp%\%~n1.yaml %~n1.yaml
)

set opt=
set dir=..\..\..\static\galleries\%~n1

if not exist %dir% mkdir %dir%
if not exist %dir%\300x mkdir %dir%\300x
if not exist %dir%\x300 mkdir %dir%\x300
if not exist %dir%\450x mkdir %dir%\450x
if not exist %dir%\800x mkdir %dir%\800x
if not exist %dir%\1366x mkdir %dir%\1366x
if not exist %dir%\1920x mkdir %dir%\1920x

REM for /f "delims=*" %%A in ('dir /a-d/b "*.tif"') do (
   REM magick "%%A" -resize 240x %opt% "%dir%\300x\%%~nA.jpg"
   REM magick "%%A" -resize x300 %opt% "%dir%\x300\%%~nA.jpg"
   REM magick "%%A" -resize 450x450 %opt% "%dir%\450x\%%~nA.jpg"
   REM magick "%%A" -resize 800x800 %opt% "%dir%\800x\%%~nA.jpg"
   REM magick "%%A" -resize 1366x1366 %opt% "%dir%\1366x\%%~nA.jpg"
   REM magick "%%A" -resize 1920x1920 %opt% "%dir%\1920x\%%~nA.jpg"
REM )

for /f "delims=*" %%A in ('dir /a-d/b "*.jpg"') do (
   magick "%%A" -resize 240x %opt% "%dir%\300x\%%~nA.jpg"
   magick "%%A" -resize x300 %opt% "%dir%\x300\%%~nA.jpg"
   copy /Y "%%A" "%dir%\1920x\%%~nA.jpg"
)

shift
goto loop

:continue
pause