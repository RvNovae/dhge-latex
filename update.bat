rem Update the build folder
cd .\build
set "GIT_DHGE_LATEX_HOME=https://raw.githubusercontent.com/RvNovae/dhge-latex/develop/build"
curl %GIT_DHGE_LATEX_HOME%/template.tex -o template.tex
mkdir components
curl %GIT_DHGE_LATEX_HOME%/components/com.tex -o components/com.tex
curl %GIT_DHGE_LATEX_HOME%/components/deckblatt.tex -o components/deckblatt.tex
curl %GIT_DHGE_LATEX_HOME%/components/eherenwort.tex -o components/eherenwort.tex
curl %GIT_DHGE_LATEX_HOME%/components/package.config.tex -o components/package.config.tex
curl %GIT_DHGE_LATEX_HOME%/components/setup.tex -o components/setup.tex
curl %GIT_DHGE_LATEX_HOME%/components/alphabetic-ibid.cbx -o components/alphabetic-ibid.cbx

rem Delete unneccesary files and folders
rd /q /s tests 
cd ..
del -f .gitignore
del -f .travis.yml
rd /q /s .git
cd assets
cd img 
del -f .gitkeep
cd ..
cd ..