%%
%% 湖北大学硕士论文模板（HBUT Thesis Class）
%% 编译方式：XeLaTeX + Biber
%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hbutthesis}[2025/10/21 HBUT Master Thesis Class]

% ----------------- 基础设置 -----------------
\LoadClass[12pt,a4paper,twoside]{ctexbook}

% ----------------- 常用宏包 -----------------
\RequirePackage{type1cm}
\RequirePackage{xeCJK}
\RequirePackage{ctex}
\RequirePackage{fontspec}
\RequirePackage[margin=0cm,footskip=30pt]{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{datetime2}
\RequirePackage{ragged2e}
\RequirePackage{setspace}
\RequirePackage{unicode-math} % 数学编辑
\RequirePackage{chemfig}
\RequirePackage{tikz}
\RequirePackage{listingsutf8}
\RequirePackage{xcolor}
\RequirePackage{array}
\RequirePackage{tabularx} % 表格设计
\RequirePackage{longtable}  % 允许跨页
\RequirePackage{diagbox} % 表格单元格设计
\RequirePackage{makecell} % 表格单元格内换行
\RequirePackage{booktabs} % 表格线条
\RequirePackage{multirow}
\RequirePackage{siunitx}
\RequirePackage{enumitem}
\RequirePackage{microtype}
\RequirePackage{titlesec}
\RequirePackage{titling} % 标题格式
\RequirePackage{tocloft}
\RequirePackage{indentfirst}
\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage[backend=biber,style=gb7714-2015,gbnamefmt=lowercase,doi=false,url=false]{biblatex} % 文献管理
\RequirePackage{tcolorbox}
\RequirePackage[colorlinks=true,linkcolor=black,urlcolor=black,citecolor=black]{hyperref} % 超链接
\RequirePackage{algorithm}
\RequirePackage{algorithmic} % 伪代码
\RequirePackage[normalem]{ulem}
\RequirePackage{caption}
\RequirePackage{placeins} % 浮动机制控制
\RequirePackage{etoolbox}
\RequirePackage{needspace}
\RequirePackage{pifont} % 五角星

% ----------------- 字体设置 -----------------
\ctexset{fontset=none}

\setmainfont{Times New Roman}
\setmathfont{XITS Math}

\setCJKmainfont{SimSun} % 宋体
\setCJKsansfont{SimHei} % 黑体
\newCJKfontfamily{\bfheiti}[AutoFakeBold={3.17}]{SimHei} % 粗黑体
\setCJKmonofont{FangSong} 

% ----------------- 代码设置 -----------------

\lstdefinelanguage{C++}{
  keywords={int, double, float, return, void, if, else, for, while, break, continue, class, public, private, protected, include, using, namespace, std, cout, cin},
  sensitive=true,
  morecomment=[l]{//},
  morecomment=[s]{/*}{*/},
  morestring=[b]"
}

\lstdefinelanguage{Python}{
  keywords={def, return, if, elif, else, for, while, break, continue, in, import, as, from, class, True, False, None, print},
  sensitive=true,
  morecomment=[l]{\#},
  morestring=[b]",
  morestring=[b]'
}

\lstdefinelanguage{R}{
  keywords={if, else, repeat, while, function, for, in, next, break, TRUE, FALSE, NULL, Inf, NaN},
  morecomment=[l]{\#},
  sensitive=true,
  morestring=[b]",
}

\lstset{
  basicstyle=\ttfamily\zihao{-5},
  keywordstyle=\color{blue}\bfseries,
  commentstyle=\color{gray}\itshape,
  stringstyle=\color{orange},
  numbers=left,
  numberstyle=\tiny\color{gray},
  stepnumber=1,
  frame=single,
  breaklines=true,
  showstringspaces=false,
  columns=flexible,
  keepspaces=true,
  postbreak=\mbox{\textcolor{black}{$\hookrightarrow$}\space},
  aboveskip=0.5em,
  belowskip=0.5em
}


% ----------------- 页面与段落 -----------------
\geometry{a4paper, left=2.5cm, right=2.5cm, top=2.5cm, bottom=2.5cm, includehead=false, includefoot=false}
\setlength{\parindent}{2em} % 缩进设置
\setlength{\parskip}{0pt}

% ----------------- 页眉页脚 -----------------
\pagestyle{fancy}
\fancyhf{}
\fancyhead{}
\fancyhead[CE]{\songti\zihao{5}{湖北大学硕士学位论文}}
\fancyhead[CO]{\songti\zihao{5}{\leftmark}}
\renewcommand{\headrulewidth}{1.5pt}
\fancyfoot{}
\fancyfoot[C]{\fontspec{Times New Roman}\zihao{-5}\thepage}

\fancypagestyle{romanfancy}{
  \fancyhf{}
  \renewcommand{\headrulewidth}{0pt}
  \fancyfoot[C]{\thepage}
}

\fancypagestyle{intro}{
  \fancyhf{}
  \fancyhead[C]{\songti\zihao{5}绪论}
  \fancyfoot[C]{\thepage}
}

\fancypagestyle{thanks}{
  \fancyhf{}
  \fancyhead[C]{\songti\zihao{5}致谢}
  \fancyfoot[C]{\thepage}
}

% ----------------- 浮动体与其他元素之间的距离 -----------------
\setlength{\floatsep}{12pt plus 0pt minus 0pt}   % 两个浮动体之间
\setlength{\textfloatsep}{20pt plus 0pt minus 0pt}  % 浮动体与正文之间
\setlength{\intextsep}{20pt plus 0pt minus 0pt}  % 插入式浮动体和正文之间
\makeatletter
\setlength{\@fptop}{0pt} % 图片单独一页时置顶
\makeatother
\raggedbottom % 允许标题占据底部

% ----------------- 自定义命令 -----------------
\newcommand{\unkown}{\colorbox{red}}
\newcommand{\tnr}{\fontspec{Times New Roman}}
\newcommand{\genename}{\fontspec{Times New Roman}\textit}
\newcommand{\ulink}[1]{\href{#1}{\color{black}\uline{\detokenize{#1}}}}
\renewcommand{\floatpagefraction}{0.9} % 图只要占一页的 ≥90% 才会单独成页
\renewcommand{\topfraction}{0.9} % 允许图几乎顶满页面
\renewcommand{\bottomfraction}{0.9}
\renewcommand{\textfraction}{0.05} % 允许正文非常少，减少浮动体被推走

% ===== 修改目录编号格式 =====

\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftdotsep}{1}  % 省略号密集
% 目录文字字体
\renewcommand{\cftchapfont}{\zihao{5}}
\renewcommand{\cftsecfont}{\zihao{5}}
\renewcommand{\cftsubsecfont}{\zihao{5}}
\renewcommand{\cfttabfont}{\songti\zihao{5}}
\renewcommand{\cftfigfont}{\zihao{5}}
% 页码字体
\renewcommand{\cftchappagefont}{\zihao{5}}
\renewcommand{\cftsecpagefont}{\zihao{5}}
\renewcommand{\cftsubsecpagefont}{\zihao{5}}
\renewcommand{\cfttabpagefont}{\zihao{5}}
\renewcommand{\cftfigpagefont}{\zihao{5}}
% 编号字体
\makeatletter
\renewcommand{\numberline}[1]{\tnr #1\quad}
\renewcommand{\l@figure}[2]{%
  \@dottedtocline{1}{1.5em}{2.3em}{\tnr 图~#1}{#2}
}
\renewcommand{\l@table}[2]{%
  \@dottedtocline{1}{1.5em}{2.3em}{\tnr 表~#1}{#2}
}
\makeatother
% 行距
\setlength{\cftbeforechapskip}{3pt}
\setlength{\cftbeforesecskip}{3pt}
\setlength{\cftbeforesubsecskip}{3pt}
\setlength{\cftbeforefigskip}{3pt}
\setlength{\cftbeforetabskip}{3pt}
%首行缩进
\setlength{\cftsecindent}{0em}
\setlength{\cftsubsecindent}{1.2em}

\ctexset{chapter={name={第,章}, number=\arabic{chapter}}}
\ctexset{contentsname = {\heiti 目\hspace{0.5em} 录}}
\renewcommand{\listfigurename}{\heiti 图目录}
\renewcommand{\listtablename}{\heiti 表目录}

% ----------------- 章节格式 -----------------
\preto{\chapter}{\FloatBarrier\Needspace{1\baselineskip}}
\preto{\subsection}{\Needspace{1\baselineskip}}
\preto{\subsubsection}{\Needspace{1\baselineskip}}

\titleformat{\chapter}[block]
  {\centering\heiti\zihao{-2}}
  {第\,\thechapter\,章}{1em}{}
\titleclass{\chapter}{straight}
\titleformat{name=\chapter,numberless}[block]
  {\centering\heiti\zihao{-2}}{}{0pt}{}

\ctexset{
  section={
    format={\heiti\zihao{-3}},  % 标题格式
    aftername={\ },                    % 编号后空半格
    name={\hspace{2em},}, 
    beforeskip=0pt plus 0pt minus 0pt,
    afterskip=0pt plus 0pt minus 0pt
  }, 
  subsection={
    format={\heiti\zihao{4}},  % 标题格式
    aftername={\ },                    % 编号后空半格
    name={\hspace{2em},}, 
    beforeskip=0pt plus 0pt minus 0pt,
    afterskip=0pt plus 0pt minus 0pt
  }, 
  subsubsection={
    format={\heiti\zihao{-4}},  % 标题格式
    aftername={\ },                    % 编号后空一格
    name={\hspace{2em},}, 
    beforeskip=0pt plus 0pt minus 0pt,
    afterskip=0pt plus 0pt minus 0pt
  }
}

\defbibheading{bibintoc}[\refname]{% 参考文献
  \chapter*{\centering\heiti\zihao{-2} #1}
  \addcontentsline{toc}{chapter}{#1}
}

% 各级标题编号格式
\renewcommand\thesection{\thechapter.\arabic{section}}                % 章.节
\renewcommand\thesubsection{\thesection.\arabic{subsection}}          % 章.节.小节
\renewcommand\thesubsubsection{\thesubsection.\arabic{subsubsection}} % 章.节.小节.小小节

% 调整 section 与正文间距
\titlespacing*{\chapter}{0pt}{0.5\baselineskip}{0.5\baselineskip}
\titlespacing*{\section}{0pt}{0.5\baselineskip}{0.5\baselineskip}
\titlespacing*{\subsection}{0pt}{0.5\baselineskip}{0.5\baselineskip}
\titlespacing*{\subsubsection}{0pt}{0.5\baselineskip}{0.5\baselineskip}

% ----------------- 参考文献 -----------------
\renewcommand*{\supercitedelim}{\addcomma\space}
\renewcommand*{\bibfont}{\zihao{5}}

% ----------------- 图表标题 -----------------
\DeclareCaptionLabelFormat{htlabelformat}{\heiti#1~#2} % 去掉引号
\DeclareCaptionFormat{htcapformat}{\centering\heiti#1#2#3}
\DeclareCaptionFont{xiaosi}{\zihao{-4}}
\setlength{\heavyrulewidth}{1.2pt} % 顶线、底线
\setlength{\lightrulewidth}{0.6pt} % 中间线

% 使用 \AtBeginDocument 确保 ctex 相关设置加载后再覆盖
\AtBeginDocument{%
  \captionsetup[figure]{aboveskip=-5pt,labelformat=htlabelformat,format=htcapformat,font=xiaosi,labelfont=normalfont,labelsep=quad,singlelinecheck=false}%
  \captionsetup[table]{labelformat=htlabelformat,format=htcapformat,font=xiaosi,labelfont=normalfont,labelsep=quad}%
}

\renewcommand{\thefigure}{\thechapter-\arabic{figure}}
\renewcommand{\thetable}{\thechapter-\arabic{table}}

\newenvironment{figcaption}{
  \vspace{0pt}
  \begin{spacing}{1.5}
}{
  \end{spacing}
  \vspace{0pt}
}

% ----------------- 表格列类型 -----------------
\newcolumntype{L}[1]{>{\raggedright\arraybackslash}p{#1}}
\newcolumntype{C}[1]{>{\centering\arraybackslash}p{#1}}
\newcolumntype{R}[1]{>{\raggedleft\arraybackslash}p{#1}}
\newcolumntype{J}[1]{>{\justifying\arraybackslash}p{#1}}

% ----------------- 参考文献排版 -----------------
\AtBeginBibliography{\vspace{2\baselineskip}}

% ----------------- 附录指令 -----------------
\newcommand{\makehbuappendix}{
  \appendix
  % ===== 重置章节 =====
  \setcounter{chapter}{0}
  \ctexset{appendix/number=\arabic{chapter}}
  \renewcommand{\thechapter}{\arabic{chapter}}

  % ===== 修改标题格式 =====
  \titleformat{\chapter}[block]
    {\centering\heiti\zihao{-2}}
    {附录\thechapter}{1em}{}

  % ===== 修改目录编号 =====
  \renewcommand{\chaptername}{附录}

  % ===== 页眉 =====
  \pagestyle{fancy}
  \fancyhf{}
  \fancyhead{}
  \fancyhead[CE]{\songti\zihao{5}{湖北大学硕士学位论文}}
  \fancyhead[CO]{\songti\zihao{5}{\leftmark}}
  \renewcommand{\headrulewidth}{1.5pt}

  \fancyfoot[C]{\fontspec{Times New Roman}\zihao{-5}\thepage}

  % ===== 表格编号 =====
  \renewcommand{\thetable}{\arabic{table}}
  \renewcommand{\tablename}{附表}
}
