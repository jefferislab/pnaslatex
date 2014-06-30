pnaslatex
=========

Unofficial LaTeX class and LyX layout files for PNAS article submissions.

## Introduction
PNAS accepts [LaTeX submissions](http://www.pnas.org/site/authors/LaTex.xhtml) and provides a LaTeX class and style file for this purpose.
Unfortunately, it is very hard to use these to produce decent output, with features such as side captions and modern LaTeX features available through Xe-/Lua-LaTeX being unsupported.
After quite a bit of hacking, James Manton in the lab gave up on trying to use them and re-engineered an alternative version from scratch to give a much more satisfactory output.

It is important to remember that these files are unofficial and include a few hacks to produce output that is similar to, but not exactly identical, to that produced by the official files.
In fact, these files produce output that is closer in appearance to that of a final, PNAS-published article than either of the PNAS-provided LaTeX files or the PNAS online manuscript length checking service.

An [example document](https://github.com/jefferislab/pnaslatex/blob/master/examples/pnas_example.pdf?raw=true), based on the official PNAS LaTeX example, is included in the ``examples`` directory, along with full [LaTeX source](https://github.com/jefferislab/pnaslatex/blob/master/examples/pnas_example.tex).
This has a number of advantages over the PNAS-provided example, such as Unicode suppport for both text and mathematics, the ability to use side captions for figures and tables, proper bibliography support (i.e. BibTeX, biblatex, etc. can be used instead of lists of ``\bibitem``s) and easier customisation. 


## LaTeX
Advantages over the official PNAS files include:
 * Side captions font figures and tables
 * Bibliographies generated via BibTeX, BibLaTeX, etc., rather than lists of ``\bibitem`` in the LaTeX source
 * Support for native Unicode via compilation with XeLaTeX or LuaLaTeX
 * Easy font configuration
 * Well-documented, simple code, in fewer than 200 lines (cf. > 3300 lines in the official class file)

Required packages: ``geometry``, ``fontspec``, ``caption``, ``sidecap``, ``titling``, ``ftnright``, ``calc``, ``lettrine``, ``fancyhdr``, ``ifthen``, ``lastpage``, and ``titlesec``.
By default, the Myriad Pro and TeX Gyre Termes font families are used for sans-serif and serif text, respectively.

## LyX


## Installation


## Usage