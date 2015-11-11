\documentclass[UTF8]{ctexart}
\usepackage{graphicx}
\usepackage{multirow}
\usepackage{booktabs}
\usepackage{latexsym}
\usepackage{indentfirst}
\usepackage{amssymb}
\usepackage{ulem}
\setlength{\parindent}{2em}
\usepackage{color}
\definecolor{lbcolor}{rgb}{0.9,0.9,0.9}
\usepackage{listings}
\lstset{backgroundcolor=\color{lbcolor}}
\lstset{keywordstyle=\color[rgb]{0,0,1}}
\lstset{commentstyle=\color[rgb]{0.133,0.545,0.133}}
\lstset{stringstyle=\color[rgb]{0.627,0.126,0.941}}
\lstset{language=Matlab}
\lstset{numbers=left}
\lstset{breaklines=true}
\usepackage{amsmath}
\author{何舜成}
\date{2012011515}
\title{Machine Learning Exercise 4}
\begin{document}
\maketitle
\textbf{1. Give a proof of $VC(\mathcal{H})=VC(\Phi)$}\par
\uline{Proof}:\par
Given the condition $VC(\Phi)=d$, we know $\exists z_{1},z_{2},\cdots,z_{d}$ such that\par
\begin{equation*}
|\{(\phi(z_{1}),\cdots,\phi(z_{d}))|\phi\in\Phi\}|=2^{d}
\end{equation*}\par
and there are no $z_{1},\cdots,z_{d},z_{d+1}$ such that\par
\begin{equation*}
|\{(\phi(z_{1}),\cdots,\phi(z_{d+1})|\phi\in\Phi\}|=2^{d+1}
\end{equation*}\par
Define set $\mathcal{S}_{Z}=\{(f(x_{1}),\cdots,f(x_{d}))|f\in\mathcal{H}\}$ and $\mathcal{T}_{Z}=\{(\phi(z_{1}),\cdots,\phi(z_{d}))|\phi\in\Phi\}$ for a fixed sequence $Z=(z_{1},\cdots,z_{d}),z_{i}=(x_{i},y_{i})$.\par
Let $g_{Z}(S)=(I(y_{1}\neq s_{1}),\cdots,I(y_{d}\neq s_{d}))=(y_{1},\cdots,y_{d})\oplus(s_{1},\cdots,s_{d})$ ($\oplus$ stands for XOR). Since for all binary sequence $S_{1},S_{2},S_{1}\neq S_{2}$, $g_{Z}(S_{1})\neq g_{Z}(S_{2})$ holds true, and for all binary sequence $T$, $\exists S_{T}$ such that $g_{Z}(S_{T})=T$, function $g_{Z}(\cdot):\mathcal{S}_{Z}\to\mathcal{T}_{Z}$ is \textbf{bijection}, and two sets $\mathcal{S}_{Z}$ and $\mathcal{T}_{Z}$ are equipotent.\par
If $VC(\Phi)=d$, then $\exists z_{1},z_{2},\cdots,z_{d}$ such that\par
\begin{equation*}
|\{(f(x_{1}),\cdots,f(x_{d}))|f\in\mathcal{H}\}|=|\{(\phi(z_{1}),\cdots,\phi(z_{d}))|\phi\in\Phi\}|=2^{d}
\end{equation*}
and for all $z_{1},\cdots,z_{d},z_{d+1}$\par
\begin{equation*}
|\{(f(x_{1}),\cdots,f(x_{d+1}))|f\in\mathcal{H}\}|=|\{(\phi(z_{1}),\cdots,\phi(z_{d+1})|\phi\in\Phi\}|\neq 2^{d+1}
\end{equation*}\par
Therefore $VC(\mathcal{H})=d$, and vice versa.\par
\vspace{10pt}
\textbf{2. Prove the equivalence of the two optimization problems}\par
\begin{eqnarray*}
 &\max_{w,b,t} &t \\
&s.t. &y_{i}(w^{T}x_{i}+b)\geq t,\forall i\in[n]\\
& &||w||=1
\end{eqnarray*}\par
\textbf{and}\par
\begin{eqnarray*}
&\min_{w,b} & \frac{1}{2}||w||^{2}\\
&s.t. &y_{i}(w^{T}x_{i}+b)\geq 1,\forall i\in[n]
\end{eqnarray*}\par
\uline{Proof}:\par
The primal problem $\Leftrightarrow$\par
\begin{eqnarray*}
 &\max_{w,b,t} &\frac{t}{||w||} \\
&s.t. &y_{i}((\frac{w}{t})^{T}x_{i}+\frac{b}{t})\geq 1,\forall i\in[n]\\
& &||w||=1
\end{eqnarray*}\par
Let $v=\frac{w}{t}$ and $c=\frac{b}{t}$, then the primal $\Leftrightarrow$\par
\begin{eqnarray*}
 &\max_{v,c} &\frac{1}{||v||} \\
&s.t. &y_{i}(v^{T}x_{i}+c)\geq 1,\forall i\in[n]
\end{eqnarray*}\par
It is obvious that maximizing $\frac{1}{||v||}$ is equivalent to minimizing $\frac{1}{2}||v||^{2}$, and the primal $\Leftrightarrow$\par
\begin{eqnarray*}
&\min_{v,c} & \frac{1}{2}||v||^{2}\\
&s.t. &y_{i}(v^{T}x_{i}+c)\geq 1,\forall i\in[n]
\end{eqnarray*}\par
\vspace{10pt}
\textbf{3. Give the dual problem of the latter one of \textbf{Ex 2}, namely the dual problem of}\par
\begin{eqnarray*}
&\min_{w,b} & \frac{1}{2}||w||^{2}\\
&s.t. &y_{i}(w^{T}x_{i}+b)\geq 1,\forall i\in[n]
\end{eqnarray*}
\uline{Solution}:\par
Define the Langrangian function\par
\begin{equation*}
\mathcal{L}(w,b,\alpha)=\frac{1}{2}||w||^{2}-\sum_{i=1}^{n}\alpha_{i}(y_{i}(w^{T}x_{i}+b)-1), \forall i\in[n], \alpha_{i}\geq 0
\end{equation*}\par
Set the partial derivatives to zero, w.r.t. $w$ and $b$ respectively, and we get\par
\begin{eqnarray*}
\frac{\partial\mathcal{L}}{\partial w}=0 &\Rightarrow &w=\sum_{i=1}^{n}\alpha_{i}y_{i}x_{i} \\
\frac{\partial\mathcal{L}}{\partial b}=0 &\Rightarrow &\sum_{i=1}^{n}\alpha_{i}y_{i}=0
\end{eqnarray*}\par
Therefore\par
\begin{eqnarray*}
\mathcal{L}(w,b,\alpha) &= &\frac{1}{2}||w||^{2}-\sum_{i=1}^{n}\alpha_{i}(y_{i}(w^{T}x_{i}+b)-1) \\
&=&\frac{1}{2}w^{T}w-\sum_{i=1}^{n}\alpha_{i}y_{i}w^{T}x_{i}-\sum_{i=1}^{n}\alpha_{i}y_{i}b+\sum_{i=1}^{n}\alpha_{i}\\
&=&\frac{1}{2}w^{T}\sum_{i=1}^{n}\alpha_{i}y_{i}x_{i}-w^{T}\sum_{i=1}^{n}\alpha_{i}y_{i}x_{i}-b\sum_{i=1}^{n}\alpha_{i}y_{i}+\sum_{i=1}^{n}\\
&=&-\frac{1}{2}w^{T}\sum_{i=1}^{n}\alpha_{i}y_{i}x_{i}+\sum_{i=1}^{n}\alpha_{i}\\
&=&-\frac{1}{2}(\sum_{i=1}^{n}\alpha_{i}y_{i}x_{i})^{T}\sum_{i=1}^{n}\alpha_{i}y_{i}x_{i}+\sum_{i=1}^{n}\alpha_{i}\\
&=&\sum_{i=1}^{n}\alpha_{i}-\frac{1}{2}\sum_{i,j=1}^{n}\alpha_{i}\alpha_{j}y_{i}y_{j}x_{i}^{T}x_{j}
\end{eqnarray*}\par
The dual problem can be described as follow\par
\begin{eqnarray*}
 &\max_{\alpha} &\sum_{i=1}^{n}-\frac{1}{2}\sum_{i,j=1}^{n}\alpha_{i}\alpha_{j}y_{i}y_{j}x_{i}^{T}x_{j} \\
&s.t.&\alpha_{i}\geq 0,\forall i\in[n]\\
& &\sum_{i=1}^{n}\alpha_{i}y_{i}=0
\end{eqnarray*}\par
\end{document}