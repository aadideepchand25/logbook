setlocal enabledelayedexpansion

set FILES=
for %%F in (entries\*.md) do set FILES=!FILES! %%F

pandoc README.md %FILES% -o export\logbook.pdf