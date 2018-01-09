for /r %1 %%f in (*.html) do (
      pandoc --wrap=none -s -f html -w markdown_mmd+yaml_metadata_block-raw_html -o %%~dpnf.mmark %%f
)
