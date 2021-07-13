# DHGE-LaTeX [![Build Status](https://github.com/RvNovae/dhge-latex/actions/workflows/ci-dhge-latex.yaml/badge.svg)](https://github.com/RvNovae/dhge-latex/actions/workflows/ci-dhge-latex.yaml) <!-- omit in toc -->
Inoffizielles LaTeX-Template für Projektarbeiten für Technik-Studiengänge an der Dualen Hochschule Gera Eisenach

# Inhaltsverzeichnis <!-- omit in toc -->
- [Installation](#installation)
  - [LaTeX Installation](#latex-installation)
  - [Setup](#setup)
- [Latex Tipps](#latex-tipps)
  - ["Variablen"](#variablen)
  - [Environment (Umgebung)](#environment-umgebung)
    - [Common Environment's](#common-environments)
- [Zitate und Literaturverzeichnis](#zitate-und-literaturverzeichnis)
  - [Zitat als Fußnote einfügen](#zitat-als-fußnote-einfügen)
    - [Beispiel](#beispiel)
  - [Hochgestelltes Zitat einfügen](#hochgestelltes-zitat-einfügen)
    - [Beispiel](#beispiel-1)
  - [Tipps](#tipps)
    - [Firma als Autor](#firma-als-autor)
    - [Mehrere Autoren](#mehrere-autoren)
- [Abbildungen](#abbildungen)
  - [LaTeX Abbildungen](#latex-abbildungen)
    - [Beispiel](#beispiel-2)
  - [dhge-latex Abbildungen](#dhge-latex-abbildungen)
    - [Beispiel](#beispiel-3)
- [WIP: Abkürzungen](#wip-abkürzungen)
- [Anlagenverzeichnis](#anlagenverzeichnis)
  - [Verwendung](#verwendung)
    - [Beispiel](#beispiel-4)
- [Code einfügen mit Minted](#code-einfügen-mit-minted)
- [Spezielle Abschnitte](#spezielle-abschnitte)
  - [SubSubSubSection](#subsubsubsection)
    - [Beispiel](#beispiel-5)
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


# Latex Tipps

<!-- todo: add more -->
Ein relativ simples [LaTeX-Tutorial](https://www.latex-tutorial.com/tutorials/first-document/) zum einfachen Einstieg in die Welt von TeX. 
> _ist allerdings durch das Template nicht nötig, nachfolgendes sollte ausreichen_

## "Variablen"
Variablen gibt es in TeX an sich nicht wie in anderen Sprachen.
```
\def\<variablenName>{<variablenWert>}
```
Der `\def` Befehl definiert ein Command der letztendlich dem folgendem entspricht
```
\newcommand{\<variablenName>}{<variablenWert>}
```
Richtig werden diese "Variablen" dann durch `\<variablenName>`**`{}`** aufgerufen.

Es ist aber auch möglich sie einfach nur durch `\<variablenName>` aufzurufen.\
> Hier ist zu beachten ist das nach der Variable das Leerzeichen fehlt wird, da dieses als Argument aufgenommen wird

## Environment (Umgebung)
Ein Codeblock welcher bestimmte Anläufe vor und nach dem eigenen Code laufen lässt.
```
\begin{<environment>}
  <codeAndText>
\end{<environment>}
```
### Common Environment's
* [itemize/enumerate](https://en.wikibooks.org/wiki/LaTeX/List_Structures)
* [table/tabular](https://en.wikibooks.org/wiki/LaTeX/Tables)
* [figure](https://en.wikibooks.org/wiki/LaTeX/Floats,_Figures_and_Captions)

# Zitate und Literaturverzeichnis

## Zitat als Fußnote einfügen

Dafür wird der `footcite` Befehl genutzt. Dieser bietet folgende Syntax: 
```
\footcite[Postnote]{literatur_id}
```

### Beispiel
```
\footcite[S. 42]{mapi}
```

## Hochgestelltes Zitat einfügen
Alternativ kann nun auch der `supercite` Befehl verwendet werden:
```
\supercite[Postnote]{literatur_id}
```

### Beispiel
```
\supercite[S. 42]{mapi}
```

***

<!-- todo: is this still a thing? the vscode extension does this pretty well without crying -->
**Bei jeder Änderung in `literatur.bib` müssen folgende Schritte durchgeführt werden:**
1. Das Projekt kompilieren (`pdflatex.exe -synctex=1 -interaction=nonstopmode "template".tex`)
1. Biber ausführen (`biber.exe "template"`)
1. Das Projekt 2x kompilieren
***
> Werden die oben genannten Schritte nicht durchgeführt, kommt es zu Darstellungsfehlern bei Zitaten und dem Literaturverzeichnis.

***

## Tipps
### Firma als Autor
Wird als "Autor" eine Firma verwendet, sollten doppelte `{}` in der `literatur.bib` verwendet werden.
Das bewirkt Wunder.
### Mehrere Autoren
Mehrere Autoren können mit `and` verknüpft werden. Beispielsweise: `author={Felix Prillwitz and Oliver Kogel and 谭九鼎}`


# Abbildungen

- Abbildungen werden durch das Template in `assets/img` gefunden.
  - `\includegraphics{<imgName>}` entspricht `\includegraphics{assets/img/<imgName>}`
  - anpassbar durch `\graphicspath	{{<newImagePath>}}`
    - **`<newImagePath>`** ist aus der sicht von `build/` zu sehen
    - `\graphicspath	{{../assets/img/}}}`

## LaTeX Abbildungen
```
\begin{figure}[<options>]
	\caption{<captionName>}
	\includegraphics[<imgOptions>]{<imgName>}
	\label{<labelName>}
\end{figure}
```

### Beispiel
```
\begin{figure}[H]
	\centering
	\caption{testImgName}
	\includegraphics[scale=0.75]{imgName}
	\label{fig:anlagentest}
\end{figure}
```
- `[H]` - entspricht dem fixieren an der Stelle im Text
- `[scale=0.75]` - skaliert das Bild auf 75% der Originalgröße
- `fig:anlagentest` - `fig:` oder `tab:` ist ein typischer Anfang von Referenzen für entsprechend `figure` oder `table` Umgebung 

## dhge-latex Abbildungen
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

### Beispiel
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


# WIP: Abkürzungen 
> Hinweis: In naher Zukunft soll auf das `acro` package umgestiegen werden, siehe dazu https://github.com/RvNovae/dhge-latex/issues/60
<!-- todo: @LordofAgents Anpassungen -->
<!-- Struktur evtl. Anwendung, Beispiel (siehe Zitate oder Abbildungen) muss aber nicht unbedingt so sein -->
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

> wird automatisch generiert

## Verwendung
* Anlagen werden in der anlagen.tex hinterlegt.
  * hierbei ist zu beachten:
      * die Anlage muss sich in einer Umgebung vom Typ `figure` oder `table` befinden
      * die Anlage benötigt eine Beschriftung `\caption{}`
  * ein Label ist nicht nötig für eine automatische Verknüpfung im Anlagenverzeichnis
  * der vorgefertigte Befehl `\dhgefigure`, kann verwendet werden, da dieser beide Anforderungen erfüllt
  * siehe Beispiel `build/tests/anlagen.tex`

### Beispiel
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

### Beispiel
```latex
\dhgeparagraph{This is a SubSubSubSection}
```


# Unicode Alphabete

Falls chinesische, japanische o.ä. Alphabete verwendet werden müssen (bsp. bedingt durch Autoren), ist die einfachste Methode das `CJKutf8` Package zu laden.

Eine Anleitung finden Sie in [diesem Artikel](https://www.overleaf.com/learn/latex/chinese).
=======
# DHGE-LaTeX [![Build Status](https://github.com/RvNovae/dhge-latex/actions/workflows/ci-dhge-latex.yaml/badge.svg)](https://github.com/RvNovae/dhge-latex/actions/workflows/ci-dhge-latex.yaml) <!-- omit in toc -->
Inoffizielles LaTeX-Template für Projektarbeiten für Technik-Studiengänge an der Dualen Hochschule Gera Eisenach

# Inhaltsverzeichnis <!-- omit in toc -->
- [Installation](#installation)
  - [LaTeX Installation](#latex-installation)
  - [Setup](#setup)
- [Latex Tipps](#latex-tipps)
  - ["Variablen"](#variablen)
  - [Environment (Umgebung)](#environment-umgebung)
    - [Common Environments](#common-environments)
- [Zitate und Literaturverzeichnis](#zitate-und-literaturverzeichnis)
  - [Zitat als Fußnote einfügen](#zitat-als-fußnote-einfügen)
  - [Hochgestelltes Zitat einfügen](#hochgestelltes-zitat-einfügen)
  - [Tipps](#tipps)
    - [Firma als Autor](#firma-als-autor)
    - [Mehrere Autoren](#mehrere-autoren)
    - [Indirektes Zitat](#indirektes-zitat)
- [Abbildungen](#abbildungen)
  - [LaTeX Abbildungen](#latex-abbildungen)
  - [dhge-latex Abbildungen](#dhge-latex-abbildungen)
- [WIP: Abkürzungen](#wip-abkürzungen)
- [Anlagenverzeichnis](#anlagenverzeichnis)
  - [Verwendung](#verwendung)
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


# Latex Tipps

<!-- todo: add more -->
Ein relativ simples [LaTeX-Tutorial](https://www.latex-tutorial.com/tutorials/first-document/) zum einfachen Einstieg in die Welt von TeX.
> _ist allerdings durch das Template nicht nötig, nachfolgendes sollte ausreichen_

## "Variablen"

Variablen gibt es in TeX an sich nicht wie in anderen Sprachen.

```
\def\<variablenName>{<variablenWert>}
```

Der `\def` Befehl definiert ein Command der letztendlich dem folgendem entspricht

```
\newcommand{\<variablenName>}{<variablenWert>}
```

Richtig werden diese "Variablen" dann durch `\<variablenName>`**`{}`** aufgerufen.

Es ist aber auch möglich sie einfach nur durch `\<variablenName>` aufzurufen.\
> Hier ist zu beachten ist das nach der Variable das Leerzeichen fehlt wird, da dieses als Argument aufgenommen wird

## Environment (Umgebung)

Ein Codeblock welcher bestimmte Anläufe vor und nach dem eigenen Code laufen lässt.
```
\begin{<environment>}
  <codeAndText>
\end{<environment>}
```

### Common Environments

* [itemize/enumerate](https://en.wikibooks.org/wiki/LaTeX/List_Structures)
* [table/tabular](https://en.wikibooks.org/wiki/LaTeX/Tables)
* [figure](https://en.wikibooks.org/wiki/LaTeX/Floats,_Figures_and_Captions)

# Zitate und Literaturverzeichnis

## Zitat als Fußnote einfügen

Dafür wird der `footcite` Befehl genutzt. Dieser bietet folgende Syntax:

```
\footcite[Postnote]{literatur_id}
```

Beispiel:

```
\footcite[S. 42]{mapi}
```

## Hochgestelltes Zitat einfügen

Alternativ kann nun auch der `supercite` Befehl verwendet werden:

```
\supercite[Postnote]{literatur_id}
```

Beispiel:

```
\supercite[S. 42]{mapi}
```

***

<!-- todo: is this still a thing? the vscode extension does this pretty well without crying -->
**Bei jeder Änderung in `literatur.bib` müssen folgende Schritte durchgeführt werden:**
1. Das Projekt kompilieren (`pdflatex.exe -synctex=1 -interaction=nonstopmode "template".tex`)
2. Biber ausführen (`biber.exe "template"`)
3. Das Projekt 2x kompilieren

***

> Werden die oben genannten Schritte nicht durchgeführt, kommt es zu Darstellungsfehlern bei Zitaten und dem Literaturverzeichnis.

***

## Tipps

### Firma als Autor

Wird als "Autor" eine Firma verwendet, sollten doppelte `{}` in der `literatur.bib` verwendet werden.
Das bewirkt Wunder.

### Mehrere Autoren

Mehrere Autoren können mit `and` verknüpft werden. Beispielsweise: `author={Felix Prillwitz and Oliver Kogel and 谭九鼎}`

### Indirektes Zitat

Wird `\footcite` oder `\supercite` mit beiden optionalen Parametern aufgerufen, so ist die Syntax wie folgt:

```
\footcite[Prenote][Postnote]{id}
```

Beispiel:

```
\supercite[Vgl.][]{Computerphile.2020}
```

# Abbildungen

- Abbildungen werden durch das Template in `assets/img` gefunden.
  - `\includegraphics{<imgName>}` entspricht `\includegraphics{assets/img/<imgName>}`
  - anpassbar durch `\graphicspath	{{<newImagePath>}}`
    - **`<newImagePath>`** ist aus der sicht von `build/` zu sehen
    - `\graphicspath	{{../assets/img/}}}`

## LaTeX Abbildungen

```
\begin{figure}[<options>]
	\caption{<captionName>}
	\includegraphics[<imgOptions>]{<imgName>}
	\label{<labelName>}
\end{figure}
```

Beispiel:

```
\begin{figure}[H]
	\centering
	\caption{testImgName}
	\includegraphics[scale=0.75]{imgName}
	\label{fig:anlagentest}
\end{figure}
```

- `[H]` - entspricht dem fixieren an der Stelle im Text
- `[scale=0.75]` - skaliert das Bild auf 75% der Originalgröße
- `fig:anlagentest` - `fig:` oder `tab:` ist ein typischer Anfang von Referenzen für entsprechend `figure` oder `table` Umgebung

## dhge-latex Abbildungen

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

Beispiel:

```latex
\dhgefigure[h]{mapi_outgoing_illustration}{scale=0.75}{Absenden einer MAPI Nachricht}{fig:mapi}[mapi][S. 17ff]
```

***

Wir empfehlen den Befehl als Snippet im Text-Editor zu hinterlegen.
In Visual Studio Code kann ein Snippet folgendermaßen konfiguriert werden:
1. _CTRL+Shift+P_
2. `Preferences: Configure User Snippets`
3. bereits existierenden latex Snippet File auswählen **oder** `New Global Snippets File...`
4. Snippet einfügen:

```json
"DHGE Figure": {
  "prefix": "dhgefigure",
  "body": "\\dhgefigure[H]{${1:filename}}{scale=${6:1.0}}{${2:Caption}}{fig:${3:label}}[${4:biblatex_id}][${5:Postnote}]",
  "description": "Insert \\dhgefigure"
}
```

# WIP: Abkürzungen

> Hinweis: In naher Zukunft soll auf das `acro` package umgestiegen werden, siehe dazu https://github.com/RvNovae/dhge-latex/issues/60
<!-- todo: @LordofAgents Anpassungen -->
<!-- Struktur evtl. Anwendung, Beispiel (siehe Zitate oder Abbildungen) muss aber nicht unbedingt so sein -->
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

> wird automatisch generiert

## Verwendung

* Anlagen werden in der anlagen.tex hinterlegt.
  * hierbei ist zu beachten:
      * die Anlage muss sich in einer Umgebung vom Typ `figure` oder `table` befinden
      * die Anlage benötigt eine Beschriftung `\caption{}`
  * ein Label ist nicht nötig für eine automatische Verknüpfung im Anlagenverzeichnis
  * der vorgefertigte Befehl `\dhgefigure`, kann verwendet werden, da dieser beide Anforderungen erfüllt
  * siehe Beispiel `build/tests/anlagen.tex`

Beispiel:

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

Beispiel:

```latex
\dhgeparagraph{This is a SubSubSubSection}
```

# Unicode Alphabete

Falls chinesische, japanische o.ä. Alphabete verwendet werden müssen (bsp. bedingt durch Autoren), ist die einfachste Methode das `CJKutf8` Package zu laden.

Eine Anleitung finden Sie in [diesem Artikel](https://www.overleaf.com/learn/latex/chinese).
