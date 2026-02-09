setlocal enabledelayedexpansion

rem Delete old PDF
del export\logbook.pdf 2>nul

rem Collect all markdown files
set FILES=
for %%F in (entries\*.md) do (
    set FILES=!FILES! "%%F"
)

rem Run pandoc
pandoc "README.md" !FILES! ^
  --metadata-file=pandoc.yaml ^
  --from markdown+header_attributes+link_attributes ^
  --pdf-engine=xelatex ^
  --include-in-header=header.tex ^
  -o export\logbook.pdf
