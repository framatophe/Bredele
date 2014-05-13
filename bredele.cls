%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%% BREDELE V.3.0 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Révision des en-tetes et prise en compte de [twoside]
% révision de la gestion de la bibliographie avec BiblaTex
% Ajouts de boites et encarts grisés
% révision de l'enchaînement des chapitres
% Mise aux normes typographiques suivant les Règles Typographiques
% en usage à l'Imprimerie Nationale
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ... et n'oubliez pas : il y a à peu près autant d'exigences de mise en page
% de thèses qu'il y a d'ignorants en matière de typographie.
% Cela vaut aussi pour le créateur de cette classe....
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Cette classe de document est basee sur [book].
% Assurez vous d'avoir installe tous les paquets utiles
%%%%%% Licence%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% la classe LaTeX Bredele est placee sous licence GNU-GPL v3
% copyright 2010 Christophe Masutti
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.

% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.

% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                .
%               ,O,
%              ,OOO,
%        'oooooOOOOOooooo'
%          `OOOOOOOOOOO`
%            `OOOOOOO`
%            OOOO'OOOO
%           OOO'   'OOO
%          O'         'O
%Les Bredele sont des petis gâteaux alsaciens, 
% confectionnés généralement durant les fêtes de fin
% d'année, parfois en forme d'étoile. Délicieux !
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bredele}[14/09/2010 v2.0]

\LoadClass[twoside,12pt,a4paper]{book}	% notez le "twoside", essentiellement pour alterner les en-tete et pieds de page gauche et droit si on veut utliser les fancyhead. 

\RequirePackage[utf8]{inputenc} % Merci à Jean-Marc Hamon pour rappeler qu'il faut faire attention à l'encodage :)
\RequirePackage[french]{babel}
\RequirePackage{ifpdf, color}
\RequirePackage{textcomp}

\RequirePackage[T1]{fontenc} % permet de spécifier à LaTeX l'utilisation du codage de caractères T1, nouvelle norme LaTeX non utilisée par défaut pour des raisons de compatibilité avec les anciens documents LaTeX.
\RequirePackage{lmodern} % Assurer une bonne impression!
\RequirePackage{tikz} % tikz est utilise pour tracer des boites, par exemple
\RequirePackage{fix-cm}
\RequirePackage{graphicx} % Pour insérer des images. Utiliser le format jpg pour plus de simplicité.
\RequirePackage{sectsty} % obligatoire, pour jouer avec l'apparence des titres
\RequirePackage{shorttoc} % pour le sommaire, au debut.
\RequirePackage{fancyhdr} % Afin de réaliser soi-même les en-têtes et pieds de page, voir chaque début de chapitre.
\RequirePackage{pifont} % Pour utiliser des symboles divers.

\RequirePackage[inner=30mm,outer=20mm,top=30mm,bottom=20mm]{geometry}

%Ou bien : \RequirePackage[top=4 cm, bottom=4 cm, left=3 cm, right=3 cm]{geometry} % On peut modifier ces valeurs pour augmenter ou réduire les marges. Attention aux en-têtes de chapitres. 

\RequirePackage{setspace} % permet d'utiliser les commandes \spacing, doublespace (double interligne), singlespace (simple interligne) et onehalfspace (un interligne et demi)

\RequirePackage{hyperref} %Utiliser pour une bibliographie interactive + sommaire et TOC interactifs (pour une sortie PDF, par exemple).
\hypersetup{colorlinks=true, citecolor=black, filecolor=black, linkcolor=black, urlcolor=black}

% A ajouter dans hypersetup pour plus de visibilite dans les proprietes du document
%pdftitle={titre du document}, pdfauthor={auteur}, pdfcreator={PdfLaTeX}, pdfkeywords={mots-clé}, pdfsubject={sujet du document}

\RequirePackage{framed} % utilise pour coloriser les encarts
\RequirePackage{color} % pour les couleurs

\onehalfspacing %Interligne 1,5

\RequirePackage{ifthen}

\RequirePackage{csquotes}
\frenchspacing
\FrenchFootnotes



%%%%%%%%%%%%%% En-tete de chapitre %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Les lignes suivantes définissent l'esthetique des débuts de chapitre.
% Cette sequence a ete recuperee sur Internet, createur inconnu...
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\makeatletter
\def\thickhrulefill{\leavevmode \leaders \hrule height 1ex \hfill \kern \z@}
\def\@makechapterhead#1{%
  \vspace*{-30\p@}%
  {\parindent \z@ \raggedleft \reset@font
            \scshape \@chapapp{} \thechapter
        \par\nobreak
        \interlinepenalty\@M
    \Huge \bfseries #1\par\nobreak
    %\vspace*{1\p@}%
    \hrulefill
    \par\nobreak
    \vskip 50\p@
  }}
\def\@makeschapterhead#1{%
 \vspace*{-50\p@}%
  {\parindent \z@ \raggedleft \reset@font
            \scshape \vphantom{\@chapapp{} \thechapter}
        \par\nobreak
        \interlinepenalty\@M
    \Huge \bfseries #1 \par\nobreak
    %\vspace*{1\p@}%
    \hrulefill
    \par\nobreak
    \vskip 30\p@
  }}

%%%%%%%%%%%%%%%%%%%% Fin en-tête de chapitre %%%%%%%%%%%%%%%%%%%

%%%%%%%%%%% Tete de parties %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\makeatletter
\newcommand*{\jolipart}[1]{%
	\begin{center}
		\begin{Huge}\color{black}
			#1
		\end{Huge}
		\end{center}
		\vspace{1cm}		
	\begin{center}
%\begin{Huge}
		%\ding{167}
	%\end{Huge}	
	\hrulefill
	\end{center}		
	}


\parttitlefont{\jolipart}

\partnumberfont{\sc\normalsize}



%%%%%%%%%%%%%%%% COULEURS grises %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\definecolor{grisfonce}{RGB}{49,49,49}
\definecolor{grisclair}{RGB}{111,111,111}
\definecolor{blanc}{RGB}{255,255,255}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%% REGLAGE DE LA BIBLIOGRAPHIE %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%% ATTENTION, on utilise Biblatex %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[style=verbose-trad1,hyperref,backend=biber]{biblatex} %Pour le style 
% biblatex avec gestion des mots clés des entrées bibliographiques
% + les abbréviations idem, ibidem, op cit. Nécessite de prévoir un fichier
%  bib contenant ces mots-clés. Vous pouvez changer l'option verbose-trad1 
% pour une autre (cf. manuel de biblatex).
% ATTENTION : l'option backend=biber est utilisée. En effet les dernieres
% versions de biblatex préconisent l'option biber pour profiter des dernières
% nouveautés. Si vous choisissez cette option (backend=biber), il vous faut
% simplement compiler avec $biber nomdufichier (sans le .tex). Si vous voulez
% en rester à bibtex,il vous suffit de placer backend=bibtex.

\bibliography{biblio} %Nom du fichier bibtex a utiliser.
\defbibheading{primary}{\section*{Sources primaires}} % Categorie (sous forme de section) pour le tri de la bibliographie.

\defbibheading{secondary}{\section*{Sources secondaires}} % Categorie (sous forme de section) pour le tri de la bibliographie.

\renewcommand*{\newunitpunct}{\addcomma\space} % Virgule entre les parties d'une reference (merci a Josquin Debaz)

%%%% Ajustements pour la bibliographie
%\DeclareFieldFormat[article]{volume}{\textbf{#1}}  %Le numero de volume en gras
\DeclareFieldFormat[article]{number}{\textit{#1}} %Le numero dans le volume en italique
%\DeclareFieldFormat{pages}{page(s): #1} % page(s) en toutes lettres, si on veut...

\renewcommand{\mkibid}[1]{\emph{#1}} %Les locutions latines en italique (comme ibid, loc.cit. , etc.) Merci à Josquin Debaz

% Et pour mettre le in en italique dans la reférence biblio (merci encore à Josquin Debaz)
\DefineBibliographyStrings{french}{%
        in = {\emph{in}}%
}


%%%%%%%%%%%%%%%%%% Interligne simple pour citations et vers %%%%%%%%%
%% Environnements: QUOTE, QUOTATION, VERSE
% Copyright (C) 2002 Mike Nolta <mrnolta@princeton.edu>, GPL V. 2.0 and
% later version. http://www.physics.princeton.edu/cosmology/computing/PrincetonThesis.cls
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\let\orig@quote\quote
\let\endorig@quote\endquote
\renewenvironment*{quote}
	{\begin{orig@quote}\begin{singlespace}}
	{\end{singlespace}\end{orig@quote}}

\let\old@quotation\quotation
\let\endold@quotation\endquotation
\renewenvironment*{quotation}
	{\begin{old@quotation}\begin{singlespace}}
        {\end{singlespace}\end{old@quotation}}

\let\old@verse\verse
\let\endold@verse\endverse
\renewenvironment*{verse}
	{\begin{old@verse}\begin{singlespace}}
        {\end{singlespace}\end{old@verse}}

%%%%%%%%%%%%%%%% TITRE THESE PAGE DE GARDE %%%%%%%%%%%%%%%%

%logo universite

\newcommand*{\logouniversite}[1]{\gdef\@logouniversite{#1}}
\logouniversite{}

\newcommand*{\scalelogouniversite}[1]{\gdef\@scalelogouniversite{#1}}
\scalelogouniversite{}

% Logo Labo
\newcommand*{\logolabo}[1]{\gdef\@logolabo{#1}}
\logolabo{}

\newcommand*{\scalelogolabo}[1]{\gdef\@scalelogolabo{#1}}
\scalelogolabo{}

% Nom de l'universite
\newcommand*{\nomdeuniversite}[1]{\gdef\@nomdeuniversite{#1}}
\nomdeuniversite{}

%%%% Eventuel sous-titre
\newcommand{\lesoustitre}[1]{\gdef\@lesoustitre{#1}}
\lesoustitre{}

%%%% Discipline
\newcommand{\discipline}[1]{\gdef\@discipline{#1}}
\discipline{}

%%%% Nom du directeur de these
\newcommand{\dirdethese}[1]{\gdef\@dirdethese{#1}}
\dirdethese{}

%%%% Titre du directeur de these
\newcommand{\titredudirdethese}[1]{\gdef\@titredudirdethese{#1}}
\titredudirdethese{}


%%%% Jury
\newcommand{\jury}[1]{\gdef\@jury{#1}}
\jury{}

%%%% Laboratoire / department / unité
\newcommand{\unite}[1]{\gdef\@unite{#1}}
\unite{}

%%%%% Ecole doctorale
\newcommand{\ecoledoc}[1]{\gdef\@ecoledoc{#1}}
\ecoledoc{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%mise en page de la page de garde
\makeatletter
\def\maketitle{%
	\thispagestyle{empty}
	\clearpage
	\begin{tikzpicture}[remember picture,overlay,line width=0mm]
  \draw [draw=white,fill=white]
    (current page.north west) rectangle (\paperwidth,1);
  \node[xshift=0\paperwidth,yshift=2cm,text=white,font=\bf\Large] {
  \includegraphics[scale=\@scalelogouniversite]{\@logouniversite}
  };
  \node[xshift=.6\paperwidth,yshift=2cm,text=white,font=\bf\Large] {
  \includegraphics[scale=\@scalelogolabo]{\@logolabo}
  };
   \node at (current page.center)
{\parbox{13cm}{

	\begin{center}
		\sffamily\Large Thèse présentée pour obtenir le  grade de docteur \\ \@nomdeuniversite
	\end{center}
\begin{center}
\begin{huge}
\ding{167}
\end{huge}
\end{center}
\begin{center}
\@unite \\
\@ecoledoc
\end{center}
	\begin{center}
		\textbf{Discipline : \@discipline}
	\end{center}
\vspace{2cm}
\noindent\rule{13cm}{0.5mm}
	\begin{center}
		{\setlength{\baselineskip}{1.4\baselineskip}
		\begin{huge}
			\textbf{\@title}
		\end{huge}
		\par}
	\end{center}
	\begin{center}
		
		\textbf{\@lesoustitre}
	\end{center}
\noindent\rule{13cm}{0.5mm}
	\begin{flushright}
		\textsc{Par : \textbf{\@author}}
	\end{flushright}
%\vspace{1cm}
\bigskip
	\begin{flushleft}
		\textbf{Sous la direction de} \textsc{\@dirdethese}, \@titredudirdethese
	\end{flushleft}
	\textsc{Membres du jury:}
	\begin{footnotesize}
		\@jury
	\end{footnotesize}
	\begin{flushright}
		\textbf{Date de soutenance :} \@date
	\end{flushright}
}
};
\end{tikzpicture}
}

\makeatother



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% En-tetes %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%% Pour suppirmer les entetes et pied de page gênants par exemple juste avant un chapitre sur une page de droite
\newcommand{\clearemptydoublepage}{%
   \newpage{\pagestyle{empty}\cleardoublepage}}
%%%% .... et utiliser la commande \clearemptydoublepage juste avant le \chapter


    \fancyhf{}                       % on annule le fancy automatique
   

%%%%%%%%%% Gerer les en tetes dans les frontmatter mainmatter et backmatter

\RequirePackage{etoolbox}

\appto\frontmatter{\pagestyle{fancy}
\renewcommand{\sectionmark}[1]{}
\renewcommand{\chaptermark}[1]{\markboth{\textit{#1}}{}}
\fancyhead[LE,RO]{\small\thepage}
    \fancyhead[RO]{\small\leftmark}   % \rightmark = section courante
    \fancyhead[LE]{\small\leftmark} % \leftmark = chapitre courant
    \fancyfoot[C]{\thepage}               % marque la page au centre
}

\appto\mainmatter{\pagestyle{fancy}
\renewcommand{\sectionmark}[1]{\markright{\textit{\thesection.\ #1}}}
\renewcommand{\chaptermark}[1]{\markboth{\chaptername~\thechapter~--\ \textit{#1}}{}}
\fancyhead[LE,RO]{\small\thepage}
    \fancyhead[RO]{\small\rightmark}   % \rightmark = section courante
    \fancyhead[LE]{\small Partie~\thepart, \leftmark} % \leftmark = chapitre courant
    \fancyfoot[C]{\thepage}               % marque la page au centre
}     

\appto\backmatter{\pagestyle{fancy}
\renewcommand{\sectionmark}[1]{\markright{\thesection.\ #1}}
\renewcommand{\chaptermark}[1]{\markboth{\chaptername~\thechapter~--\ #1}{}}
\fancyhead[LE,RO]{\small\thepage}
    \fancyhead[RO]{}   % \rightmark = section courante
    \fancyhead[LE]{} % \leftmark = chapitre courant
    \fancyfoot[C]{\thepage}               % marque la page au centre

} 


%%%%%%%%%%%%%% FAIRE DES ENCARTS %%%%%%%%%%%%%%%%%%%%%%%%%%
% Couleurs :


\definecolor{fondtitre}{RGB}{85,85,85}
\definecolor{fonddeboite}{RGB}{232,232,232}
\definecolor{shadecolor}{RGB}{232,232,232}

\ProcessOptions

%%%%%%%%%% Boitemagique  %%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand*{\boitemagique}[2]{
\begin{center}
\begin{tikzpicture}
% la boite
\node[rectangle,draw=fondtitre!100,fill=fonddeboite!100,inner sep=10pt, inner ysep=20pt] (mabox)
{
\begin{minipage}{12cm}
#2
\end{minipage}
};
% le titre de la boite
\node[fill=fondtitre!100, text=white, rectangle] at (mabox.north) {\sffamily\textbf{#1}};
\end{tikzpicture}
\end{center}
}

%%%%%% boitesimple %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand*{\boitesimple}[1]{%
\begin{center}
\begin{minipage}{12cm}
\begin{shaded}
	#1
\end{shaded}
\end{minipage}
\end{center}
}


   

