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

If you use these files in a submission to PNAS I would appreciate an email to ``ajd.manton <at> googlemail <dot> com`` so I can maintain a rough idea of how useful these files are.
If you try and use these files and instead resort to using the official PNAS files or submitting a Word document I would very much appreciate an email detailing why, so that I can try and improve the files/support.


## Advantages over the official PNAS files
These include:

  * **Side captions for figures and tables**, just like in actual PNAS articles
  * **Full support for Unicode**, so you can write:

        \frac{\Dif{θ}}{\Dif{t}} = \frac{∂θ}{∂t} + u · ∇θ = 0

    rather than:

        \frac{\Dif{\theta}}{\Dif{t}} = \frac{\partial \theta}{\partial t} + u \cdot \nabla \theta = 0

  * **Sensible bibliography handling**, via BibTeX, BibLaTeX, etc., such that instead of:
  
        \bibitem{BN}
            M.~Belkin and P.~Niyogi, {\em Using manifold structure for partially labelled classification}, Advances in NIPS, 15 (2003).
        \bibitem{BBG:EmbeddingRiemannianManifoldHeatKernel}
            P.~B\'erard, G.~Besson, and S.~Gallot, {\em Embedding {R}iemannian manifolds by their heat kernel}, Geom. and Fun. Anal., 4 (1994), pp.~374--398.

    you can just write:
    
        \bibliography{mybibfile}

    and use your favourite reference manager to organise the references, with BibLaTeX/BibTeX handling the formatting for you.

  * **Easy font configuration**, with PNAS-like fonts used by default out-of-the-box without any need to specify Karl Berry names, etc. as with the official files
  
  * **Well-documented, simple code**, in fewer than 200 lines (cf. > 3300 lines in the official class file)


## LaTeX
A small number of common packages are required for full functionality:

  * ``geometry`` – specifies paper size
  * ``fontspec`` — specifies fonts
  * ``titlesec`` – formats section headers
  * ``lettrine`` — used for initial dropcap at start of article
  * ``fancyhdr`` — specifies the headers and footers
  * ``ifthen`` — ensures the right footer appears on the right pages
  * ``lastpage`` — allows the footer to contain the total number of pages
  * ``caption`` — handles table and figure captions
  * ``sidecap`` — provides the ability to use side captions
  * ``titling`` – used for article title
  * ``ftnright`` — necessary for the Significance Statement and Publication Footnotes
  * ``calc`` — ensures Significance Statement and Publication Footnotes use the right amount of space
  
By default, the [Myriad Pro](https://typekit.com/fonts/myriad-pro) and [TeX Gyre Termes](http://www.gust.org.pl/projects/e-foundry/tex-gyre/termes) font families are used for sans-serif and serif text, respectively.

## LyX


## Installation
To install the LyX file, ``pnas.layout``, copy it to the ``layouts`` folder of your [user directory](http://wiki.lyx.org/LyX/UserDir) and then reconfigure LyX using Tools > Reconfigure. After restarting LyX, a new PNAS document class should be selectable.


## Usage
