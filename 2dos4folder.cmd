pushd "%~1"
for /r %%f in (*.m*) do (
      echo %%f
)
pause
