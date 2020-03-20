# dhge-latex
WIP: Inoffizelles LaTeX-Template für Projektarbeiten für Technik-Studiengänge an der Dualen Hochschule Gera Eisenach

## TODO
* Literaturverzeichnis braucht eventuell noch Anpassungen, was spezielle Arten von Werken betrifft. Entspricht aber schon größtenteils den Spezifikationen
* Blocksatz ist zwar gegeben, aber Worttrennungen am Zeilenende funktionieren eventuell noch nicht richtig
* Langform von Ebenda ist massiver Workaround, sollte angepasst werden
* Abbildungen

## Instructions
1. Install a flavour of LaTeX, preferably with an editor (I'm using MikTeX + TeXstudio)
1. Download/Clone the repository or use it as a template to create your own repo
1. In your TeX configuration, add the TEXMF directory from this project as a TEXMF root directory and refresh the file name database
1. After having installed all required packages, you should now be able to build this project and start writing
1. template.tex contains a bunch of constants that you can change, so you don't have to tinker with the deckblatt itself
1. Place your acronyms in acro.tex
1. Place your bibliography in bib.
1. Write your text in main.tex and or require more .tex files of your own in there 
