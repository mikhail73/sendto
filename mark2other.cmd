@echo off
pandoc -s --smart --normalize -f markdown -w html+yaml_metadata_block+footnotes-auto_identifiers -o "%~dpn1.pandoc.html" %1
pandoc -s --smart --normalize -f markdown -w odt+yaml_metadata_block+footnotes -o "%~dpn1.pandoc.odt" %1
pandoc -s --smart --normalize -f markdown -w fb2+yaml_metadata_block+footnotes -o "%~dpn1.pandoc.fb2" %1
multimarkdown -t odf -f --nolabels --nomask %1 -o "%~dpn1.mmd.odf"
multimarkdown -t html -f --nolabels --nomask %1 -o "%~dpn1.mmd.html"
:: pandoc -f markdown_strict -w mediawiki -o %~n1.mediawiki  %1
:: for /r %1 %f in (*.html) do (pandoc  -w markdown_strict-raw_html -o %~dpnf.strict.md %f)

