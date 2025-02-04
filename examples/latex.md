## LaTeX Code Example

```latex
\documentclass[12pt,a4paper]{article}

% Commonly used packages
\usepackage{amsmath,amsthm,amssymb}  % Math packages
\usepackage{graphicx}                % For images
\usepackage{hyperref}                % For hyperlinks
\usepackage{listings}                % For code listings
\usepackage{tikz}                    % For drawings
\usepackage{xcolor}                  % For colors
\usepackage{multirow}                % For complex tables
\usepackage{lipsum}                  % For dummy text

\title{\textbf{LaTeX Features Demonstration}}
\author{Your Name}
\date{\today}

% Custom theorem environments
\newtheorem{theorem}{Theorem}[section]
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{definition}{Definition}[section]

% Custom commands
\newcommand{\R}{\mathbb{R}}
\newcommand{\norm}[1]{\left\|#1\right\|}

\begin{document}

\maketitle
\tableofcontents

\section{Mathematical Expressions}

\subsection{Inline Math}
The quadratic formula is $x = \frac{-b \pm \sqrt{b^2 - 4ac}}{2a}$. 
Let's also show a set: $S = \{x \in \R : x^2 < 4\}$.

\subsection{Display Math}
Here's a beautiful equation:
\[
    \oint_C \vec{F} \cdot d\vec{r} = \iint_S (\nabla \times \vec{F}) \cdot d\vec{S}
\]

Matrix representation:
\[
A = \begin{bmatrix}
    1 & 2 & 3 \\
    4 & 5 & 6 \\
    7 & 8 & 9
\end{bmatrix}
\]

\subsection{Aligned Equations}
\begin{align}
    (a + b)^2 &= (a + b)(a + b) \\
    &= a^2 + ab + ba + b^2 \\
    &= a^2 + 2ab + b^2
\end{align}

\section{Theorems and Proofs}

\begin{theorem}
    For any triangle, the sum of interior angles is 180°.
\end{theorem}

\begin{proof}
    This is a sample proof. \qed
\end{proof}

\begin{lemma}
    If $a|b$ and $b|c$, then $a|c$.
\end{lemma}

\section{Lists and Enumerations}

\subsection{Bullet Points}
\begin{itemize}
    \item First item
    \item Second item
        \begin{itemize}
            \item Nested item 1
            \item Nested item 2
        \end{itemize}
    \item Third item
\end{itemize}

\subsection{Numbered List}
\begin{enumerate}
    \item First step
    \item Second step
        \begin{enumerate}[a)]
            \item Sub-step a
            \item Sub-step b
        \end{enumerate}
    \item Third step
\end{enumerate}

\section{Tables}

\begin{table}[h]
\centering
\begin{tabular}{|c|c|c|}
    \hline
    \multirow{2}{*}{Item} & \multicolumn{2}{c|}{Values} \\
    \cline{2-3}
    & First & Second \\
    \hline
    A & 1 & 2 \\
    B & 3 & 4 \\
    \hline
\end{tabular}
\caption{Sample Table}
\label{tab:sample}
\end{table}

\section{Code Listings}

\begin{lstlisting}[language=Python]
def fibonacci(n):
    if n <= 1:
        return n
    return fibonacci(n-1) + fibonacci(n-2)
\end{lstlisting}

\section{Graphics with TikZ}

\begin{tikzpicture}
\draw[thick,->] (0,0) -- (4,0) node[right]{$x$};
\draw[thick,->] (0,0) -- (0,4) node[above]{$y$};
\draw[blue] (0,0) circle (1cm);
\end{tikzpicture}

\section{References and Citations}

\begin{thebibliography}{9}
\bibitem{latex2e}
  Leslie Lamport,
  \emph{LaTeX: A Document Preparation System},
  Addison-Wesley, 1994.
\end{thebibliography}

As discussed in \cite{latex2e}, LaTeX is powerful.

\appendix
\section{Additional Notes}

\lipsum[1]  % Generates dummy text

\end{document}
```