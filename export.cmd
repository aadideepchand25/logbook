setlocal enabledelayedexpansion

del export\logbook.pdf

set FILES=
for %%F in (entries\*.md) do set FILES=!FILES! %%F

pandoc README.md %FILES% ^
  --metadata-file=pandoc.yaml ^
  --include-in-header=header.tex ^
  -o export\logbook.pdf
