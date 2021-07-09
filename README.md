# DHGE-LaTeX [![Build Status](https://travis-ci.org/RvNovae/dhge-latex.svg?branch=develop)](https://travis-ci.org/RvNovae/dhge-latex) <!-- omit in toc -->
Inoffizielles LaTeX-Template für Projektarbeiten für Technik-Studiengänge an der Dualen Hochschule Gera Eisenach

## [LaTeX-Tutorial](https://www.latex-tutorial.com/tutorials/first-document/)


- [Installation](#installation)
  - [LaTeX Installation](#latex-installation)
  - [Setup](#setup)
- [Zitate und Literaturverzeichnis](#zitate-und-literaturverzeichnis)
  - [Tipps](#tipps)
    - [Firma als Autor](#firma-als-autor)
    - [Mehrere Autoren](#mehrere-autoren)
- [Abbildungen](#abbildungen)
- [Abkürzungen](#abkürzungen)
- [Anlagenverzeichnis](#anlagenverzeichnis)
    - [wird automatisch generiert](#wird-automatisch-generiert)
      - [Beispiel:](#beispiel)
- [Code einfügen mit Minted](#code-einfügen-mit-minted)
- [Spezielle Abschnitte](#spezielle-abschnitte)
  - [SubSubSubSection](#subsubsubsection)
- [Unicode Alphabete](#unicode-alphabete)

# Installation

## LaTeX Installation
Eine Installation von MikTeX über [proTeXt](https://www.tug.org/protext/) wird empfohlen.
Als Editor bieten sich beispielsweise [Visual Studio Code](https://code.visualstudio.com/) in Kombination mit der [latex-workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) Extension und [TeXstudio](https://www.texstudio.org/) an.

## Setup 
1. Das Repository downloaden, clonen, oder die Template Funktion nutzen, um ein eigenes Repository zu erstellen.
1. Mit der Update-Datei (OS abhängig .bat/.sh) kann das Template aktualisiert werden
* ### **ACHTUNG** die Update-Datei (entsprechend OS) 
  * **überschreibt** die Dateien im build Ordner
    * eigene Anpassungen sollten über die Dateien im Root-Ordner geschehen
  * **löscht** die mit git in Zusammenhang stehenden Ordner und Dateien (.git, .gitignore, .gitkeep)

Das Projekt sollte sich nun bauen lassen.

Wir empfehlen den `latexmk` Befehl zum kompilieren des Projekts (erfordert eine Perl Installation).



# Zitate und Literaturverzeichnis

**Zitat als Fußnote einfügen**

Dafür wird der `footcite` Befehl genutzt. Dieser bietet folgende Syntax: 
```
\footcite[Postnote]{literatur_id}
```

**Beispiel:** 
```
\footcite[S. 42]{mapi}
```

Alternativ kann nun auch der `supercite` Befehl verwendet werden:
```
\supercite[S. 42]{mapi}
```

***

**Bei jeder Änderung in `literatur.bib` müssen folgende Schritte durchgeführt werden:**
1. Das Projekt kompilieren (`pdflatex.exe -synctex=1 -interaction=nonstopmode "template".tex`)
1. Biber ausführen (`biber.exe "template"`)
1. Das Projekt 2x kompilieren
***
>Werden die oben genannten Schritte nicht durchgeführt, kommt es zu Darstellungsfehlern bei Zitaten und dem Literaturverzeichnis.

***

## Tipps
### Firma als Autor
Wird als "Autor" eine Firma verwendet, sollten doppelte `{}` in der `literatur.bib` verwendet werden.
Das bewirkt Wunder.
### Mehrere Autoren
Mehrere Autoren können mit `and` verknüpft werden. Beispielsweise: `author={Felix Prillwitz and Oliver Kogel and 谭九鼎}`


# Abbildungen
```latex
\dhgefigure[1]{2}{3}{4}{5}[6][7]
```
kann mit bis zu sechs Argumenten aufgerufen werden:
1. **Optional** Float Position, standardmäßig `h`
1. Relativer bild-path mit oder ohne Dateiendung (relativ zum `./assets/img` Ordner, kann in `template.tex` angepasst werden)
1. `\includegraphics` Optionen (leer lassen für Standard)
1. Bildunterschrift
1. Label für die Figure/Grafik
1. **Optional:** ID
1. **Optional:** "Postnote", beispielsweise um Seitenzahlen anzugeben

**Beispiel:**
```latex
\dhgefigure[h]{mapi_outgoing_illustration}{scale=0.75}{Absenden einer MAPI Nachricht}{fig:mapi}[mapi][S. 17ff]
```

***

Wir empfehlen den Befehl als Snippet im Text-Editor zu hinterlegen.
In Visual Studio Code kann ein Snippet folgendermaßen konfiguriert werden:
1. _CTRL+Shift+P_
1. `Preferences: Configure User Snippets`
1. bereits existierenden latex Snippet File auswählen **oder** `New Global Snippets File...`
1. Snippet einfügen:
```json
"DHGE Figure": {
  "prefix": "dhgefigure",
  "body": "\\dhgefigure[H]{${1:filename}}{scale=${6:1.0}}{${2:Caption}}{fig:${3:label}}[${4:biblatex_id}][${5:Postnote}]",
  "description": "Insert \\dhgefigure"
}
```


# Abkürzungen

werden in `abk.tex` eingetragen. Jede Abkürzung wird mit folgender Syntax versehen: 
```
\acro {1} [2] {3}
```
1. ID der Abkürzung, damit wird im Fließtext später referenziert. 
2. Die Abkürzung selbst
3. Der ausgeschriebene Begriff

Beispielweise:
```
\acro {dhge} [DHGE] {Duale Hochschule Gera Eisenach}
```

Im Fließtext wird dann mit
```
\ac{dhge}
```
die Abkürzung aufgerufen.
Das Abkürzungsverzeichnis wird dann automatisch erstellt.

***

Für mehr Informationen kann die [Acronym Package Documentation](https://ctan.mc1.root.project-creative.net/macros/latex/contrib/acronym/acronym.pdf) gelesen werden



# Anlagenverzeichnis

### wird automatisch generiert
* hierbei ist zu beachten:
    * die Anlage muss sich in einer Umgebung vom Typ `figure` oder `table` befinden
    * die Anlage benötigt eine Beschriftung `\caption{}`
* ein Label ist nicht nötig für eine automatische Verknüpfung im Anlagenverzeichnis
* der vorgefertigte Befehl `\dhgefigure`, kann verwendet werden, da dieser beide Anforderungen erfüllt

#### Beispiel:
```
\begin{table}
    \caption{TestBeschriftung}
    \begin{tabular}{c | c}
        1 & 1 \\
    \end{tabular}
\end{table}
``` 


# Code einfügen mit Minted

**Hier eine kurze Anleitung für das Minted Package. Damit lässt sich Code mit Syntaxhervorhebung direkt in LaTeX einfügen.**

1. Python installieren
1. Sicherstellen, dass die Python Umbebungsvariable gesetzt ist
1. Pygments installieren (`pip install Pygments`)
1. `\usepackage {minted}` in `build/package.config.tex` hinzufügen
1. `--shell-escape` flag im Compiler-Aufruf setzen
1. [Minted Kurz-Anleitung](https://www.overleaf.com/learn/latex/Code_Highlighting_with_minted) oder [Minted Documentation](https://ctan.mc1.root.project-creative.net/macros/latex/contrib/minted/minted.pdf) lesen

***

Bei Proxy-Problemen mit pip, kann auch das `Pygments.whl` file runtergeladen und dann mit pip installiert werden.  
[Pygments Download](https://pypi.org/project/Pygments/#files)


# Spezielle Abschnitte

## SubSubSubSection
Falls man einen Abschnitt 4. Stufe schreiben möchte, kann das mit  
```latex
\dhgeparagraph{}
```
umgesetzt werden.

**Beispiel:**
```latex
\dhgeparagraph{This is a SubSubSubSection}
```

***

> **Work in progress**


# Unicode Alphabete

Falls chinesische, japanische o.ä. Alphabete verwendet werden müssen (bsp. bedingt durch Autoren), ist die einfachste Methode das `CJKutf8` Package zu laden.

Eine Anleitung finden Sie in [diesem Artikel](https://www.overleaf.com/learn/latex/chinese).
