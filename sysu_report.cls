\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sysu_report}[2026/05/28 中山大学实验报告模板]
\LoadClass[UTF8, fontset=none]{ctexart}
% -------设置整体排版------- %
% 页面和边距
% 1.5cm 左右边距，2.5cm 上下边距，页眉高度1.5cm，页眉与正文间距0.5cm，页脚与正文间距0.8cm
\usepackage[a4paper, vmargin=2.5cm, hmargin=3cm, headheight=1.5cm, headsep=0.5cm, footskip=0.8cm]{geometry}
% 行距和段落格式
% 行间距1.625倍对应WORD中的1.5倍，首行不缩进，段前段后间距为0.8行距
\usepackage{setspace}
\setstretch{1.625}
\setlength{\parindent}{0pt}
\setlength{\parskip}{0.8\baselineskip}
% -------字体字号设置------- %
% 中文字体
% 可用\song 切换至宋体，\kai 切换至楷体，\hei 切换至黑体，\fang 切换至仿宋
\setCJKmainfont{FandolSong}
\setCJKsansfont{FandolHei}
\setCJKmonofont{FandolFang}
\setCJKfamilyfont{song}{FandolSong} \newcommand{\song}{\CJKfamily{song}}
\setCJKfamilyfont{kai}{FandolKai}   \newcommand{\kai}{\CJKfamily{kai}}
\setCJKfamilyfont{hei}{FandolHei}   \newcommand{\hei}{\CJKfamily{hei}}
\setCJKfamilyfont{fang}{FandolFang} \newcommand{\fang}{\CJKfamily{fang}} 
% 英文字体
\setmainfont{Times New Roman}
\setsansfont{Arial}
\setmonofont{Courier New}
% -------页眉和页脚------- %
\usepackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
% 页眉
\fancyhead[C]{\zihao{5}\fang{}中山大学实验报告模板}    % 页眉中间文字
\renewcommand{\headrulewidth}{0.4pt} % 页眉下方的横线粗细
% 页脚
\fancyfoot[C]{\zihao{5}\thepage}    % 页脚中间显示页码
\fancyfoot[L]{\rule[5pt]{6.7cm}{0.4pt}} % 左装饰线
\fancyfoot[R]{\rule[5pt]{6.7cm}{0.4pt}} % 右装饰线
% -------标题段落样式------- %
\usepackage{titlesec}
\usepackage{titletoc}
\titleformat{\section}{\centering\hei\bfseries\zihao{-2}}{\thesection}{1em}{}   % 一级标题
\titleformat{\subsection}{\raggedright\hei\bfseries\zihao{4}}{\thesubsection}{1em}{}    % 二级标题
\titleformat{\subsubsection}{\raggedright\hei\bfseries\zihao{-4}}{\thesubsubsection}{1em}{} % 三级标题
\titleformat{\paragraph}[hang]{\raggedright\hei\bfseries\zihao{-4}}{\theparagraph}{1em}{}   % 段落
% 标题编号到4级，目录也显示到4级，每个section另起一页
\setcounter{tocdepth}{4}
\setcounter{secnumdepth}{4}
\newcommand{\sectionbreak}{\clearpage}
% 方便独立正文环境
\newcommand{\maintext}{
    \song\zihao{-4}
    \setlength{\parindent}{2em}
    \setlength{\parskip}{0pt}
}
% -------数学环境------- %
\usepackage{amsmath, amssymb, mathrsfs, amsthm, wasysym}
\usepackage{blindtext}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\theoremstyle{definition} 
\newtheorem{thm}{定理}[section]
\newtheorem{definition}{定义}[section]
\newtheorem{lemma}{引理}[section]
\newtheorem{corollary}{推论}[section]
\theoremstyle{remark}
\newtheorem{remark}{注}[section]
\renewcommand{\proofname}{\textbf{证明}}
% -------图表，公式的编号和列表样式------- %
\usepackage{float}
\usepackage{graphicx}
\usepackage{caption}
\usepackage{subcaption}
% 图表标题设置
\DeclareCaptionFont{mylabelfont}{\hei\zihao{-4}}
\captionsetup[figure]{labelformat=default, labelsep=quad, name={图}, font=mylabelfont}
\captionsetup[table]{labelformat=default, labelsep=quad, name={表}, font=mylabelfont}
\renewcommand{\thefigure}{\ifnum\value{section}>0\relax\thesection-\fi\arabic{figure}}
\renewcommand{\thetable}{\ifnum\value{section}>0\relax\thesection-\fi\arabic{table}}
\renewcommand\theequation{\arabic{section}-\arabic{equation}}
\usepackage{booktabs}
\usepackage{tabularx}
\usepackage{makecell}
% 设置表格列类型，L为左对齐，C为居中，R为右对齐，比ccc好用些
\newcolumntype{L}{X}
\newcolumntype{C}{>{\centering\arraybackslash}X}
\newcolumntype{R}{>{\raggedleft\arraybackslash}X}
% 每章每节重新编号
\counterwithin*{footnote}{page}
\counterwithin*{figure}{section}
\counterwithin*{table}{section}
\counterwithin*{equation}{section}
% 列表环境微调，压缩下列表的行间距
\usepackage{enumitem}
\setlist{noitemsep}
% -------封面------- %
\usepackage{titling}
\renewcommand{\maketitle}{
    \def\titlelength{12em}
    \begin{titlepage}
        \begin{center}
            \vspace*{0em}
            \includegraphics[height=2cm]{fig/SYSU_logo.pdf}\\    %中大logo
            \vspace*{4em}
            {\zihao{-0}\fang\bfseries 中山大学实验报告模板}\\
            \vspace*{5em}
            {\zihao{2}\kai\bfseries \thetitle}\par
            \vspace*{6em}
            % 个人信息
            {\zihao{3}\fang\renewcommand\arraystretch{1.8}
                \begin{tabular}{lc}
                    \makebox[4em][s]{院 \hfill 系} &
                    \underline{\makebox[\titlelength]{\school}} \\
                    \makebox[4em][s]{专 \hfill 业} &
                    \underline{\makebox[\titlelength]{\major}} \\
                    \makebox[4em][s]{姓 \hfill 名} &
                    \underline{\makebox[\titlelength]{\theauthor}} \\
                    \makebox[4em][s]{学 \hfill 号} &
                    \underline{\makebox[\titlelength]{\id}} \\
                    \makebox[4em][s]{实验地点} &
                    \underline{\makebox[\titlelength]{\location}} \\
                    \makebox[4em][s]{指导教师} &
                    \underline{\makebox[\titlelength]{\instructor}} \\
                \end{tabular}\par
            }
            \vspace*{\fill}
            {\zihao{3}\fang\thedate}
        \end{center}
    \end{titlepage}
}
% -------目录------- %
\let\oldtableofcontents\tableofcontents
\renewcommand{\contentsname}{\centerline{\hei\bfseries\zihao{-2} 目\hspace{2em}录}\vspace{-2em}}
\titlecontents{section}[2em]{\song\zihao{-4}\bfseries}{\contentslabel{2em}}{\hspace*{-2em}}{\normalfont\titlerule*[8pt]{.}\contentspage}
\titlecontents{subsection}[3em]{\song\zihao{-4}}{\contentslabel{2.5em}}{\hspace*{-2.5em}}{\titlerule*[8pt]{.}\contentspage}
\titlecontents{subsubsection}[4.5em]{\song\zihao{-4}}{\contentslabel{3em}}{\hspace*{-3em}}{\titlerule*[8pt]{.}\contentspage}
\titlecontents{paragraph}[6em]{\song\zihao{-4}}{\contentslabel{3.5em}}{\hspace*{-3.5em}}{\titlerule*[8pt]{.}\contentspage}
% -------附录------- %
\usepackage[title]{appendix}
\renewcommand{\appendixname}{附录}
% -------参考文献------- %
\usepackage[numbers]{natbib}
\bibsep=0pt
\newcommand{\myrefstyle}{\centerline{\hei\bfseries\zihao{-2} 参考文献}\vspace{-2em}}
\renewcommand{\refname}{\myrefstyle}
\renewcommand{\bibname}{\myrefstyle}
% -------代码相关------- %
% 自定义颜色
% 使用\definecolor{name}{model}{color-spec}可以自定义颜色
% 例：\definecolor{MSBlue}{RGB}{52, 90, 138}定义一个名为MSBlue的颜色，使用RGB模型，颜色值为(52, 90, 138)
\usepackage[table]{xcolor}
\definecolor{codeBg}{RGB}{242,242,242}   % 代码背景色
\definecolor{myblue}{HTML}{1E90FF}  % 道奇蓝
\definecolor{keywordcolor}{RGB}{0,0,128}    % 通用关键字
\definecolor{commentcolor}{RGB}{0,128,0}  % 注释
\definecolor{stringcolor}{RGB}{153,0,0}   % 通用字符串
% 代码高亮
\usepackage{listings}
\lstset{
  backgroundcolor=\color{codeBg},   % 灰底
  numbers=left,                     % 左侧显示行号
  numbersep=5pt,                    % 行号距离
  numberstyle=\tiny\color{gray},    % 行号样式
  stepnumber=1,                     % 每行都显示行号
  breaklines=true,                  % 自动换行
  frame=single,                     % 黑框
  rulecolor=\color{black!20},       % 边框颜色
  columns=fullflexible,             % 按正常字体间距排版
  keepspaces=true,                  % 保持代码中的空格
  showspaces=false,                 % 不显示空格符号
  showstringspaces=false,           % 不显示空格占位符
  showtabs=false,                   % 不显示制表符
  basicstyle=\ttfamily\small,       % 基础字体
  keywordstyle=\color{keywordcolor}\bfseries,
  commentstyle=\color{commentcolor}\itshape,
  stringstyle=\color{stringcolor}
}
% -------自定义代码类型------- %
% Arduino
\definecolor{arduinoTeal}{HTML}{00979C}    % 数据类型、修饰符
\definecolor{arduinoOrange}{HTML}{D35400}  % 内置函数、常量
\definecolor{arduinoComment}{HTML}{434F54} % 注释颜色
\definecolor{arduinoString}{HTML}{005C5F}  % 字符串颜色
\lstdefinelanguage{Arduino}{
    language=C++,
    commentstyle=\color{arduinoComment},
    stringstyle=\color{arduinoString},
    % 第一类关键字 (蓝绿)
    keywordstyle=[1]\color{arduinoTeal}\bfseries,
    morekeywords=[1]{
        void, int, boolean, byte, char, long, float, double, String, word, 
        uint8_t, uint16_t, uint32_t, size_t, bool, unsigned,
        Serial, Wire, SPI, MFRC522, DHT, LiquidCrystal_I2C, RtcDS1302, RtcDateTime
    },
    % 第二类：控制流与基础语法 (橙)
    keywordstyle=[2]\color{arduinoOrange},
    morekeywords=[2]{
        setup, loop, if, else, for, switch, case, while, do, break, 
        continue, return, goto, define, include
    },
    %
    % 第三类：内置函数与库函数 (橙)
    keywordstyle=[3]\color{arduinoOrange},
    morekeywords=[3]{
        pinMode, digitalWrite, digitalRead, analogRead, analogWrite, 
        delay, millis, micros, delayMicroseconds, 
        begin, print, println, write, read, available, 
        init, backlight, noBacklight, setCursor, clear, 
        requestFrom, beginTransmission, endTransmission,
        transfer, transfer16, PCD_Init, PICC_IsNewCardPresent, PICC_ReadCardSerial,
        readTemperature, readHumidity, GetDateTime, SetDateTime, GetIsRunning
    },
    %
    % 第四类：常量 (橙)
    keywordstyle=[4]\color{arduinoOrange}\bfseries,
    morekeywords=[4]{
        HIGH, LOW, INPUT, OUTPUT, INPUT_PULLUP, LED_BUILTIN, true, false
    },
    tabsize=2
}
% MATLAB
\definecolor{matlabBlue}{RGB}{0,0,200}        % 关键字
\definecolor{matlabGreen}{RGB}{34,139,34}     % 注释
\definecolor{matlabPurple}{RGB}{171,12,242}   % 字符串
\lstdefinelanguage{Matlabcs}{
    language=Matlab,
    backgroundcolor=\color{codeBg},
    keywordstyle=\color{matlabBlue}\bfseries,
    commentstyle=\color{matlabGreen},
    stringstyle=\color{matlabPurple},
    morekeywords={
        parfor, spmd, gpuArray, table, timetable,
        readtable, writetable, height, width
    }
}
% -------具体引用样式------- %
% 开启书签，内部链接颜色设置为道奇蓝，引用颜色设置为道奇蓝，URL颜色设置为道奇蓝
\usepackage[bookmarks=true,colorlinks=true,linkcolor=myblue,citecolor=myblue,urlcolor=myblue]{hyperref}