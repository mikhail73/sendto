@echo on
:loop
if "%~1"=="" goto continue
  set ext=%~x1
  set ext=%ext:~1%
  if %ext%==xhtml set ext=html
  if %ext%==htm set ext=html
  pandoc --wrap=none --atx-headers -s -f %ext% -w markdown_mmd+yaml_metadata_block+pipe_tables-raw_html-mmd_header_identifiers -o "%~dpn1%~x1.md"  %1
::  if errorlevel 0 echo %~nx1 =^> %~n1.mmd.md ok
::  pandoc -s -f html -w markdown_strict-raw_html -o  "%~dpn1.strict.md"  %1
::  if errorlevel 0 echo %~nx1 =^> %~n1.strict.md ok
::  multimarkdown -t mmd -f --nolabels --nomask %1 -o "%~dpn1.mmd.mmark"
::  if errorlevel 0 echo %~nx1 =^> %~n1.mmd.mmark ok
shift
goto loop
:continue
pause



:: pandoc -f markdown_strict -w mediawiki -o %~n1.mediawiki  %1
:: for /r %1 %f in (*.html) do (pandoc  -w markdown_strict-raw_html -o %~dpnf.strict.md %f)

