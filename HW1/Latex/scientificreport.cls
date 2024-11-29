\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{scientificreport}[2024/09/30 Scientific Report Class]

% Load basic class settings
\LoadClass[12pt]{article}

% Required packages for basic functionality
\RequirePackage{amsmath}   % For mathematical symbols and environments
\RequirePackage{amsfonts}  % Additional math fonts
\RequirePackage{amssymb}   % Additional symbols
\RequirePackage{geometry}  % To set page dimensions
\RequirePackage{fancyhdr}  % For custom headers/footers
\RequirePackage{graphicx}  % To include graphics
\RequirePackage{hyperref}  % Hyperlinks
\RequirePackage{titling}   % For title page customization
\RequirePackage{titlesec}  % For section formatting
\RequirePackage{tocloft}   % For table of contents customization
% Add microtype package for better typography
\RequirePackage{microtype}

% Set page geometry
\geometry{top=1in, bottom=1in, left=1in, right=1in}

% Set up custom headers and footers
\pagestyle{fancy}
\setcounter{tocdepth}{3} % Include sections, subsections, and subsubsections in TOC
\fancyhf{}
\fancyhead[L]{\leftmark}
\fancyhead[R]{\thepage}

% Title page customization
\newcommand{\subtitle}[1]{\def\@subtitle{#1}}
\newcommand{\studentname}[1]{\def\@studentname{#1}}
\newcommand{\professorname}[1]{\def\@professorname{#1}}
\newcommand{\classname}[1]{\def\@classname{#1}}

\renewcommand{\maketitle}{%
    \begin{titlepage}
        \centering
        \vspace*{2cm}
        {\huge\bfseries\@title\par}
        \vspace{1cm}
        {\Large\@subtitle\par}
        \vspace{2cm}
        {\large\@studentname\par}
        \vspace{1cm}
        {\large Professor: \@professorname\par}
        \vspace{1cm}
        {\large\@classname\par}
        \vfill
        {\large\@date\par}
    \end{titlepage}
}

% Table of contents customization
\renewcommand{\contentsname}{Table of Contents}
\setcounter{tocdepth}{2}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}

% Section formatting
\titleformat{\section}
  {\normalfont\Large\bfseries}{\thesection}{1em}{}
\titleformat{\subsection}
  {\normalfont\large\bfseries}{\thesubsection}{1em}{}

% Math mode setup
\everymath{\displaystyle}

% Customize itemize/enumerate
\renewcommand{\labelitemi}{$\bullet$}
\renewcommand{\theenumi}{(\alph{enumi})}
\renewcommand{\labelenumi}{\theenumi}

% Begin document structure
\AtBeginDocument{
    \maketitle
    \newpage
    \tableofcontents
    \newpage
    \setcounter{page}{1}  % Reset page numbering after TOC
}

% Bibliography settings
\RequirePackage[backend=bibtex, style=numeric, sorting=none]{biblatex}
\addbibresource{references.bib} % Create references.bib file for bibliography entries

% Create a new command for bibliography
\newcommand{\printbibliographywithtitle}{%
    \newpage
    \section*{References}
    \addcontentsline{toc}{section}{References}
    \printbibliography[heading=none]
}

\endinput