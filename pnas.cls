\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{pnas}[2014/06/10 v0.1 Custom PNAS class]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Unofficial PNAS-style LaTeX document class, created by James D. Manton %
% See https://github.com/jefferislab/pnaslatex for support and updates   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Passes and class options to the underlying article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass[twoside]{article}

% Font settings
\newcommand{\sansnormal}{\fontspec{Myriad Pro}}
\newcommand{\sanssemibold}{\fontspec{Myriad Pro Semibold}}
\newcommand{\sanssemibolditalic}{\fontspec{Myriad Pro Semibold Italic}}
\newcommand{\sansbold}{\fontspec{Myriad Pro Bold}}

\newcommand{\serifnormal}{\fontspec{TeX Gyre Termes}}

% Page dimensions
\RequirePackage[paperwidth=210mm, paperheight=297mm, left=19mm, right=12mm, top=27.5mm, bottom=32mm, foot=8mm, asymmetric]{geometry}
\setlength{\columnsep}{5.2mm}
\setlength{\parindent}{5.2mm}


% Fonts
\RequirePackage{fontspec}
\setmainfont[Ligatures=TeX]{TeX Gyre Termes}
\setsansfont[Ligatures=TeX]{Myriad Pro}
\RequirePackage{unicode-math}


% Figure captions
\RequirePackage{caption}
\newfontfamily\capfont{Myriad Pro}
\DeclareCaptionFormat{capfont}{\capfont \fontsize{7.9pt}{8.5pt}\selectfont \textbf{#1#2}#3}
\captionsetup[figure]{format=capfont}
\RequirePackage{sidecap}


% Tables
% \newcommand{\myrpro}{\fontfamily{Myriad Pro}\selectfont}
% \renewcommand\sfdefault{\myrpro}
\captionsetup[table]{format=capfont}
\renewenvironment{table}{%
	\renewcommand* {\@floatboxreset}{%
		\sansnormal\fontsize{7.9pt}{8.5pt}\selectfont\@setminipage}%
	\@float{table}%
}{%
	\end@float
}


% Title
\RequirePackage{titling}
\def\affiliation#1{\def\@affiliation{#1}}
\newcommand{\printaffiliation}{\@affiliation}
\affiliation{}
\renewcommand{\maketitle}{
	\makeatletter
	% Span both columns
	\twocolumn[
		\begin{@twocolumnfalse}
			% Title
			{\sanssemibold\fontsize{22pt}{24pt}\selectfont \thetitle}

			\vspace*{10pt}
			% Author
			{\sanssemibold\fontsize{9.7pt}{12pt}\selectfont \theauthor}

			\vspace*{8pt}

			{\sansnormal\fontsize{7.9pt}{8.5pt}\selectfont
			\printaffiliation

			\vspace*{1em}

			Submitted to Proceedings of the National Academy of Sciences of the United States of America

			\vspace*{0.5em}\addcontentsline{toc}{section}{Introduction}
			}
		\end{@twocolumnfalse}
	]
}


% Abstract
\renewenvironment{abstract}{%
\sanssemibold\fontsize{8.5pt}{10.5pt}\selectfont\setlength{\parindent}{0pt}%
}{\par\vspace*{1em}}


% Keywords
\RequirePackage{color}
\newcommand{\keywords}[1]{%
	{\sansnormal\fontsize{7.9pt}{10pt}\selectfont\noindent\@for\kw:=#1\do{\kw\hspace{0.5em}|\hspace{0.5em}}\hspace{-0.875em}\fcolorbox{white}{white}{\phantom{i}}\vspace*{1em}}%
}

% Significance text
\RequirePackage{ftnright}	% To put footnotes in the right-hand column
% Undo ftnright's redefinition of footnote marks
\long\def\@makefntext#1{\parindent 1em\noindent \hb@xt@ 1.8em{\hss \@makefnmark }#1}
% Define a command for publication footnotes
\def\pubfoot#1{\def\@pubfoot{#1}}
\newcommand{\printpubfoot}{\@pubfoot}
\pubfoot{}
% Define a command for footnotes without a marker
\def\blfootnote{\gdef\@thefnmark{}\@footnotetext}
\RequirePackage{calc}
\newcommand{\significance}[1]{%
	\blfootnote{\newline
		\noindent\fbox{%
			\parbox{\linewidth-2\fboxsep-1.6pt}{%
				{\sanssemibold\fontsize{10pt}{12pt}\selectfont Significance} \newline%
				\sanssemibold\fontsize{8.5pt}{9.5pt}\selectfont\newline%
				\addfontfeature{LetterSpace=0.92,WordSpace=0.92}{#1}%
			}%
		} \\
		\vspace*{1em} \\
		\sansnormal\fontsize{7.9pt}{8.5pt}\selectfont \printpubfoot
	}%
}


% Drop cap
\RequirePackage{lettrine}
\renewcommand{\LettrineTextFont}{\rmfamily}
\newcommand{\dropcap}[1]{\lettrine[loversize=0.15,nindent=0pt]{{\sansnormal\selectfont #1}}{}}


% Footer
\RequirePackage{fancyhdr}
\RequirePackage{ifthen}
\RequirePackage{lastpage}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\fancyfoot[OC]{\sansnormal\fontsize{7.9pt}{8.5pt}\selectfont \ifthenelse{\value{page}=1}{www.pnas.org --- ---}{Footline Author} \hfill PNAS \hspace{2pt} | \hspace{2pt} \textbf{Issue Date} \hspace{2pt} | \hspace{2pt} Volume \hspace{2pt} | \hspace{2pt} Issue Number \hspace{2pt} | \hspace{2pt} \ifthenelse{\value{page}=1}{\thepage\ -- \pageref{LastPage}}{\textbf{\thepage}}}
\fancyfoot[EC]{\sansnormal\fontsize{7.9pt}{8.5pt}\selectfont \thepage \hspace{2pt} | \hspace{2pt} www.pnas.org --- --- \hfill Footline Author}
\pagestyle{fancy}


% Section headers
\setcounter{secnumdepth}{-1}
\RequirePackage{titlesec}
\titleformat{\section}{\sansbold\fontsize{7.9pt}{8.5pt}}{\arabic{section}}{0.5em}{}{}
\titlespacing*{\section}{0pt}{1em}{0pt}
\titleformat{\subsection}[runin]{\sanssemibold}{\arabic{subsection}}{0em}{}[.]
\titlespacing*{\subsection}{0pt}{1em}{1em}
\titleformat{\subsubsection}[runin]{\sanssemibolditalic}{\arabic{subsubsection}}{0em}{}[.]
\titlespacing*{\subsubsection}{0pt}{0pt}{1em}


% Materials
\newcommand{\materialsstart}{\section{Materials and Methods}%
\sansnormal\fontsize{7.9pt}{8.5pt}\selectfont}
\newcommand{\materialsend}{\serifnormal\fontsize{9.5pt}{10.5pt}\selectfont}


% Acknowledgments
\newcommand{\acknowledgments}[1]{\section{Acknowledgments}%
\sansnormal\fontsize{7.9pt}{8.5pt}\selectfont #1}


% Alter some LaTeX defaults for better treatment of figures:
    % See p.105 of "TeX Unbound" for suggested values.
    % See pp. 199-200 of Lamport's "LaTeX" book for details.
    %   General parameters, for ALL pages:
    \renewcommand{\topfraction}{0.999}   	% max fraction of floats at top
    \renewcommand{\bottomfraction}{0.999}	% max fraction of floats at bottom
    %   Parameters for TEXT pages (not float pages):
    \setcounter{topnumber}{2}
    \setcounter{bottomnumber}{2}
    \setcounter{totalnumber}{4}     % 2 may work better
    \setcounter{dbltopnumber}{2}    % for 2-column pages
    \renewcommand{\dbltopfraction}{0.999}	% fit big float above 2-col. text
    \renewcommand{\textfraction}{0.01}   	% allow minimal text w. figs
    %   Parameters for FLOAT pages (not text pages):
    \renewcommand{\floatpagefraction}{0.99}   	% require fuller float pages
                                              	% N.B.: floatpagefraction MUST be less than topfraction !!
    \renewcommand{\dblfloatpagefraction}{0.99}	% require fuller float pages

	% remember to use [htp] or [htpb] for placement

% Main text
\renewcommand{\normalsize}{\fontsize{9.5pt}{10.5pt}\selectfont}
\frenchspacing

