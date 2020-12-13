echo Update the build folder
cd build/
GIT_DHGE_LATEX_HOME="https://raw.githubusercontent.com/RvNovae/dhge-latex/master/build"
curl ${GIT_DHGE_LATEX_HOME}/template.tex -o template.tex
mkdir components
curl ${GIT_DHGE_LATEX_HOME}/components/com.tex -o components/com.tex
curl ${GIT_DHGE_LATEX_HOME}/components/deckblatt.tex -o components/deckblatt.tex
curl ${GIT_DHGE_LATEX_HOME}/components/ehrenwort.tex -o components/ehrenwort.tex
curl ${GIT_DHGE_LATEX_HOME}/components/package.config.tex -o components/package.config.tex
curl ${GIT_DHGE_LATEX_HOME}/components/setup.tex -o components/setup.tex
curl ${GIT_DHGE_LATEX_HOME}/components/alphabetic-ibid.cbx -o components/alphabetic-ibid.cbx

echo Delete  unneccesary files and folders
rm -rf tests 
cd ..
rm -f .gitignore
rm -f .travis.yml
rm -rf .git
cd assets/
cd img/
rm -f .gitkeep
cd ..
cd ..
