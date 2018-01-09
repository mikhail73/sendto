@echo on
pushd "%~1"
for /f "tokens=*" %%A in ('dir /a-d/b "*.m*"') do (
    for /f "tokens=1* delims=:" %%B in ('type "%%A"^| findstr /b slug:') do (
        for /f "tokens=*" %%D in ("%%C") do (
            if "%%A" neq "%%D%%~xA" (
               rename "%%A" "%%D%%~xA"
               echo %%A =^> %%D%%~xA
            )
        )
    )
)
pause
