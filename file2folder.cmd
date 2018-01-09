:loop
if "%~1"=="" goto continue
pushd "%~1"
for /f "tokens=*" %%A in ('dir /a-d/b "*.md" "*.mmark"') do (
    if not %%~nA==index (
      mkdir %%~nA
      move /Y %%~A %%~nA\index%%~xA
    )
)
shift
goto loop
:continue
pause


