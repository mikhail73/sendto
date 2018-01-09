:loop
if "%~1"=="" goto continue
      pushd "%~1"
      if exist frontmatter.* (
            for /f "delims=*" %%A in ('dir /a-d/b "*.m*"') do (
                  del /q "%temp%\%%A.frontmatter"
                  copy "frontmatter.*"+"%%A" "%temp%\%%A.frontmatter"
                  rename "%%A" "%%A.bak"
                  move "%temp%\%%A.frontmatter" "%%A"
            )
      )
      shift
goto loop
:continue
pause
