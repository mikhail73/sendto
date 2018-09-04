pushd "%~1"

dir /a-d/b >%temp%\%~n1.yaml
move %temp%\%~n1.yaml %~n1.yaml

set opt=
if not exist 300x mkdir 300x
if not exist x300 mkdir x300
if not exist 450x mkdir 450x
if not exist 800x mkdir 800x
if not exist 1366x mkdir 1366x
if not exist 1920x mkdir 1920x

for /f "delims=*" %%A in ('dir /a-d/b "*.tif"') do (
   magick "%%A" -resize 240x %opt% ".\300x\%%~nA.jpg"
   magick "%%A" -resize x300 %opt% ".\x300\%%~nA.jpg"
   magick "%%A" -resize 450x450 %opt% ".\450x\%%~nA.jpg"
   magick "%%A" -resize 800x800 %opt% ".\800x\%%~nA.jpg"
   magick "%%A" -resize 1366x1366 %opt% ".\1366x\%%~nA.jpg"
   magick "%%A" -resize 1920x1920 %opt% ".\1920x\%%~nA.jpg"
)
pause

REM for /f "delims=*" %%A in ('dir /a-d/b "*.tif"') do (
REM magick "%%A" %opt% ^
REM -resize 240x ".\300x\%%~nA.jpg" ^
REM -resize x300 ".\x300\%%~nA.jpg" ^
REM -resize 450x450 ".\450x\%%~nA.jpg" ^
REM -resize 800x800 ".\800x\%%~nA.jpg" ^
REM -resize 1366x1366 ".\1366x\%%~nA.jpg" ^
REM -resize 1920x1920 ".\1920x\%%~nA.jpg"
REM )

REM pause