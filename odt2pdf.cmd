pushd "%~1"
for %%A in (*.odt) do (
   soffice --headless --convert-to pdf "%%A"
)
pause
