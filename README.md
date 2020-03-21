# dhge-latex
WIP: Inoffizelles LaTeX-Template für Projektarbeiten für Technik-Studiengänge an der Dualen Hochschule Gera Eisenach

## TODO
* Literaturverzeichnis braucht eventuell noch Anpassungen, was spezielle Arten von Werken betrifft. Entspricht aber schon größtenteils den Spezifikationen
* bei Ebenda in den Fußnoten muss noch der Punkt entfernt werden
* Langform von Ebenda ist massiver Workaround, sollte angepasst werden
* Abbildungen
* Performance & Ease of use

## Instructions
1. Install a flavour of LaTeX, preferably with an editor (I'm using MikTeX + TeXstudio)
1. Download/Clone the repository or use it as a template to create your own repo
1. In your TeX configuration, add the TEXMF directory from this project as a TEXMF root directory and refresh the file name database (FNDB)
1. After having installed all required packages, you should now be able to build this project and start writing
1. template.tex contains a bunch of constants that you can change, so you don't have to tinker with the deckblatt or Ehrenwort itself
1. Place your acronyms in acro.tex (to preserve formatting, place your longest acronym in \begin{acronym}[DHGE], in template.tex)
1. Place your bibliography in bib (this template uses BibLaTeX).
1. Write your text in main.tex and or require more .tex files of your own in there 

### Adding bibliography
1. Add a bibliography entry to bib.bib
2. Compile the project once
3. Run Biber (`biber.exe "template"`, if you're compiling by hand)
4. Compile once more
