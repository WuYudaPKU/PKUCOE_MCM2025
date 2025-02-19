%% On Feb. 14, 2020, change this .cls file for the MCM changing file format at Yuhang, Hangzhou, my hometomn.
%% This is a Latex document class file for MCM.
%% Created by Guochun Ma on Jan. 19 2019 at Xiameng.
%% This class file comes from easymcm,A simple MCM Contest Report Template for basic users
%% Oringinal template by latexstudio, <latexstudio@hotmail.com>
%% improved by youjiarui189 (xjtu-blacksmith), <yjr134@163.com>

\LoadClass[12pt]{article}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{HZNUMCM}[2019/01/19]
\typeout{HZNUMCM,version 2.0}
\RequirePackage{pdfpages}



%=========基本宏包==========
\RequirePackage[a4paper,left=2.5cm,right=2.5cm,top=2.5cm,bottom=1.5cm]{geometry}    %页边距和纸张大小
\RequirePackage{xcolor}                     % 彩色宏包
\RequirePackage{fancyhdr,fancybox}          % 设置页眉页脚的宏包
\RequirePackage{graphicx,subfigure,epsfig,graphics}                   % 插图宏包
\RequirePackage[perpage]{footmisc}  
\RequirePackage{ifthen}                     % 逻辑结构宏包（仅模板文件用到）
\RequirePackage{lastpage}                   % 获得最后一面页码的宏包（生成"Page X of XX"）
\RequirePackage{paralist}                   % 用以修改itemize各项间距的宏包
% 附录和程序
\RequirePackage{listings} 
\lstset{
    breaklines=true,
    tabsize=3,
    showstringspaces=true
}
\lstdefinestyle{common}
{
    extendedchars=true,
    frame=single,
    %===========================================================
    framesep=3pt,%expand outward.
    framerule=0.4pt,%expand outward.
    xleftmargin=34pt,%make the frame fits in the text area. 
    xrightmargin=34pt,%make the frame fits in the text area.
    %=========================================================== 
    rulecolor=\color{red}
}

\lstdefinestyle{latexstyle}
{
    style=Common,
    language={[latex]tex},
    backgroundcolor=\color{yellow!10},
    keywordstyle=\color{orange},
    identifierstyle=\color{cyan},
    stringstyle=\color{red},
    commentstyle=\color{blue},
    upquote,
    numbers=left,
    keepspaces=true,
    columns=spaceflexible,
    basicstyle=\ttfamily\scriptsize,%
    breaklines=true,
    breakindent=0pt, 
    escapechar={:},
    emphstyle={[2]{\bfseries\color{Sienna2}}},
}



% 代码环境宏包
\RequirePackage[toc,page,title,titletoc,header]{appendix} % 附录制作宏包
%======基本参数========
\setlength{\headheight}{15pt}
%===设置图表标题与上下文间距===
\setlength{\belowcaptionskip}{4pt}
\setlength{\abovecaptionskip}{4pt}
%=====行间与段间距 
\RequirePackage{setspace}
\setlength{\parskip}{5.8pt} %8pt
\setlength{\baselineskip}{20pt}
%==========数学公式===========
\RequirePackage{amsthm,amsfonts}        % 定理和字体
\RequirePackage{amsmath,bm}
\RequirePackage{amssymb,mathrsfs}       % AMSLaTeX符号宏包
\RequirePackage{latexsym}

%===CITE REFERENCE===
\RequirePackage{cite}

%===使整篇文章的首段都有缩进===
\RequirePackage{indentfirst}

%=========目录的制作==========
\renewcommand\tableofcontents{%
\centerline{\normalfont\Large\bfseries\contentsname%
\@mkboth{%
\MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
\vskip 3ex%
\@starttoc{toc}%
\thispagestyle{empty}
}
%===========目录==============
\RequirePackage{titlesec}
\RequirePackage{titletoc}
\setcounter{tocdepth}{2}    % 目录显示到subsubsection(3)级别,若只需到subsection(2)请自改
\RequirePackage[font=small,]{caption}   % 使图表标题字号小一号

%=========表格相关===========
\RequirePackage{longtable,multirow,hhline,tabularx,array}   % 各种基本的表格宏包
\RequirePackage{flafter}    % 引用该宏包可避免图片在引用它的正文之前出现
\RequirePackage{pifont,calc}    % 前者实现了\ding{}命令（可自己百度），后者是底层常用宏包
\RequirePackage{colortbl,booktabs}  % 书签生成

%======字体相关========
\RequirePackage[T1]{fontenc}    % 允许使用欧洲字体（西里尔字母，拉丁字母，希腊字母等）
\RequirePackage[scaled]{berasans}   % 一个无衬线字体（在summary sheet顶部有用）
\definecolor{grey}{rgb}{0.91,0.91,0.91} % 定义灰色
\RequirePackage{url}            % 网址宏包，以下命令使得网址能自动换行
\def\UrlBreaks{\do\A\do\B\do\C\do\D\do\E\do\F\do\G\do\H\do\I\do\J
\do\K\do\L\do\M\do\N\do\O\do\P\do\Q\do\R\do\S\do\T\do\U\do\V
\do\W\do\X\do\Y\do\Z\do\[\do\\\do\]\do\^\do\_\do\`\do\a\do\b
\do\c\do\d\do\e\do\f\do\g\do\h\do\i\do\j\do\k\do\l\do\m\do\n
\do\o\do\p\do\q\do\r\do\s\do\t\do\u\do\v\do\w\do\x\do\y\do\z
\do\.\do\@\do\\\do\/\do\!\do\_\do\|\do\;\do\>\do\]\do\)\do\,
\do\?\do\'\do+\do\=\do\#}

%==============书签，插图和交叉引用的设置================
\RequirePackage{ifpdf}      % 判断是否在运行pdfLaTeX
\ifpdf%
\RequirePackage{epstopdf}   % pdfLaTeX不能使用eps图片，用该宏包转成pdf后使用
\DeclareGraphicsExtensions{.pdf,.jpg,.jpeg,.png}    % 允许的图片类型
\RequirePackage[bookmarks=true,%
    linkcolor=black,%
    citecolor=black,%
    colorlinks=true, % 注释掉此项则交叉引用为彩色边框(将colorlinks和pdfborder同时注释掉)
    %pdfborder=1,     % 注释掉此项则交叉引用为彩色边框（提示：不好看）
    linkcolor=black,%
    citecolor=black,%
    urlcolor=black]{hyperref}
\else%
\DeclareGraphicsExtensions{.eps,.ps}    %不需要转换eps图片格式
\ifxetex
    \RequirePackage[xetex,  % 运行xetex
        pdfstartview=FitH,%
        CJKbookmarks=true,%
        bookmarksnumbered=true,%
        bookmarksopen=true,%
        colorlinks=true, % 注释掉此项则交叉引用为彩色边框(将colorlinks和pdfborder同时注释掉)
        pdfborder=001,   % 注释掉此项则交叉引用为彩色边框
        linkcolor=black,%
        citecolor=black,%
        urlcolor=black]{hyperref}
\else
    \RequirePackage[dvipdfm,  % 运行其他编译引擎
        pdfstartview=FitH,%
        CJKbookmarks=true,%
        bookmarksnumbered=true,%
        bookmarksopen=true,%
        colorlinks=true, % 注释掉此项则交叉引用为彩色边框(将colorlinks和pdfborder同时注释掉)
        pdfborder=001,   % 注释掉此项则交叉引用为彩色边框
        linkcolor=black,%
        citecolor=black,%
        urlcolor=black]{hyperref}
\fi\fi



% 以下设置使得一页上最多有六个浮动对象（图、表），且顶部最多三个，底部最多三个。可自行修改参数
\setcounter{totalnumber}{6}
\setcounter{topnumber}{3}
\setcounter{bottomnumber}{3}

% 很多人发现缺省的浮动参数过于严格了。下面的命令
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}
% 将浮动参数重新设置为更宽松的值。---选自《LaTeX2e插图指南》

% 图表标题的名称，已经合规不需要再修改
\renewcommand{\figurename}{Figure}
\renewcommand{\tablename}{Table}

% 自动识别的图表文件夹，若使用这些名字命名文件夹，则引用图片路径时只需填文件名即可
\graphicspath{{./}{./img/}{./fig/}{./image/}{./figure/}{./picture/}}


% 定理环境的声明，事实上大部分论文中用不到，但仍保留以供使用
\newtheorem{theorem}{Theorem}[section]%
\newtheorem{lemma}{Lemma}[section]% 
\newtheorem{proposition}{Proposition}[section]%
\newtheorem{definition}{Definition}[section]%
\newtheorem{example}{Example}[section]%
\newtheorem{question}{Question}[section]
\newtheorem{corollary}{Corollary}[section]
\newtheorem{conjecture}{Conjecture}[section] 
\theoremstyle{definition}
\newtheorem{remark}{Remark}[section]
%---------Example------




% 生成一些所需的参数（控制号，队伍名，页眉信息） 
\newcommand{\setControlNumber}[1]{\def \controlnumber{#1} \newcommand  {\team}{Team \#\ {#1}} }
\newcommand {\setContestType}[1]{\def \contesttype {#1}
\ifthenelse{\equal{\contesttype}{MCM}}{ 
\newcommand{\contest}{MCM/ICM\\ Summary Sheet}
}{
	\ifthenelse{\equal{\contesttype}{ICM}}{
		\newcommand{\contest}{MCM/ICM\\ Summary Sheet}
	}{
	\ClassError{HZNUMCM}{without contesttype}{Please check the contest type, only choose MCM or ICM.}
	}
}
}
\newcommand{\setProblemLetter}[1]{\def \problemletter{#1}}
\newcommand{\setPaperTitle}[1]{\def \ourpapertitle{#1}}
\newcommand{\setSummary}[1]{\def \oursummary{#1}}
\newcommand{\setBibFilename}[1]{\def \ourbibfile{#1}  } 



%=====页眉页脚设置=====
\lhead{\small \team}
\chead{}
\rhead{\small Page \thepage\ of \pageref{LastPage}}
\lfoot{}
\cfoot{}
\rfoot{}

%=====摘要页=====
\def\showSummarySheet{ %生成sheet头命令的定义
    \begingroup
    \fontfamily{fvs}\fontseries{m}\selectfont  %字体设置
    % 左边的列表
    \noindent\begin{minipage}{0.3\textwidth}\centering
     {Problem Chosen}\\[10pt]
        {\color{red}\fontsize{24pt}{\baselineskip}\selectfont \textbf{\problemletter}}\normalsize\\
    \end{minipage}\hspace{\fill}
    % 中间的控制号环境
    \begin{minipage}{0.33\textwidth}
        \centering
        \textbf{ \large \the \year\ \\ {\normalsize\contest}}\\
    \end{minipage}\hspace{\fill}
    % 右边的列表
    \begin{minipage}{0.3\textwidth}
    \centering
        Team Control Number\\[10pt]
        {\color{red} \fontsize{24pt}{25pt}\selectfont  \textbf{\controlnumber} }\normalsize\\[10pt]
    \end{minipage}
   % \vspace*{1ex}   % 留出一点空
    \vskip 0.4em  
    \noindent\rule{\textwidth}{0.5pt}   % 插入一条线
    % \null
    % \vskip -1em
    \begin{center}
    \Large\bf\ourpapertitle    % 插入论文标题，注意字号可自己修改
    \end{center}
    \endgroup

    %摘要标题
     \par\centerline{\normalsize\bf Summary}\vskip3pt\par
     %摘要内容 
      {\fontsize{12pt}{13.3pt}\selectfont \oursummary}
     \par
     \thispagestyle{empty}
     %底部留空 
     \newpage % 添加此行
}

\newcommand{\showContents}{\newpage{\centering\tableofcontents}\newpage\pagestyle{fancy}\setcounter{page}{1}}

\newcommand{\showReferences}{ 
\newpage % 添加此行
\addcontentsline{toc}{section}{References}
\bibliographystyle{unsrt}%{brief}%{alpha}%{unsrt}
\bibliography{article_file}}