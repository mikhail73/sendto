:loop
if "%~1"=="" goto continue
pushd "%~1"
for /f "tokens=*" %%A in ('dir /ad/b') do (
    if exist .\%%A\index.md (
      move /Y .\%%A\index.md %%A.md
      rmdir %%A
    )
    if exist .\%%A\index.mmark (
      move /Y .\%%A\index.mmark %%A.mmark
      rmdir %%A
    )
)
shift
goto loop
:continue
pause
