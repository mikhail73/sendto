@echo on
:loop
if "%~1"=="" goto continue
  set ext=%~x1
  set ext=%ext:~1%
  set source=%1
  if %ext%==xhtml set ext=html
  if %ext%==htm set ext=html
  if %ext%==rtf (soffice --headless --convert-to odt %1)&&(set ext=odt)&&(set source="%~dpn1.odt")
  pandoc --wrap=none --atx-headers -s -f %ext% -w markdown_mmd+yaml_metadata_block+pipe_tables-raw_html-mmd_header_identifiers -o "%~dpn1%~x1.md"  %source%
shift
goto loop
:continue
pause



:: pandoc -f markdown_strict -w mediawiki -o %~n1.mediawiki  %1
:: for /r %1 %f in (*.html) do (pandoc  -w markdown_strict-raw_html -o %~dpnf.strict.md %f)

