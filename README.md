# 中山大学实验报告 LaTeX 模板

基于 `ctexart` 的校内实验报告模板，使用 XeLaTeX 编译，已配置好封面、目录、字体、页眉页脚、定理环境、图表编号、代码高亮、附录、参考文献等全套样式，开箱即用。

## 快速开始

```bash
# 1. 克隆或下载本模板
git clone <repo-url>

# 2. 使用 latexmk 编译（自动处理交叉引用和参考文献）
latexmk -xelatex main.tex

# 或者在 VS Code 中打开，用 LaTeX Workshop 扩展编译
```

> 需要系统安装 [TeX Live](https://tug.org/texlive/)（推荐）或 MiKTeX，并确保 `Fandol` 字体族可用。

## 文件结构

```
.
├── sysu_report.cls   # 文档类（核心样式定义）
├── main.tex          # 使用教程 + 示例报告（也是主入口）
├── cite.bib          # 参考文献（GB/T 7714 格式，百度学术可生成）
├── fig/
│   ├── SYSU_logo.pdf           # 封面校徽
│   ├── example_circuit.png     # 示例图片
│   ├── example_dc.bmp          # 示例图片
│   └── example_ro.bmp          # 示例图片
└── README.md
```

## 使用步骤

### 1. 填写封面信息

在 `main.tex` 的导言区修改以下字段：

```latex
\title{实验报告标题}
\def\school{电子与信息工程学院}
\def\major{电子信息科学与技术}
\author{张三}
\def\id{20260000000}
\def\location{东校区实验中心}
\def\instructor{李四}
\date{\today}
```

### 2. 编写正文

在 `\section{}` 中填写内容。所有一级标题（`\section`）会自动另起一页。

### 3. 管理参考文献

将百度学术生成的 GB/T 7714 BibTeX 条目粘贴到 `cite.bib`，在正文中用 `\cite{key}` 引用。

## 功能速览

| 功能 | 说明 |
|------|------|
| 封面 | 校徽 + 标题 + 个人信息 + 日期，`\maketitle` 自动生成 |
| 目录 | `\tableofcontents`，显示 4 级标题，含引导点线 |
| 四级标题 | `\section` / `\subsection` / `\subsubsection` / `\paragraph` |
| 中文字体 | `\song` 宋体 / `\kai` 楷体 / `\hei` 黑体 / `\fang` 仿宋 |
| 数学公式 | `equation`、`align`、`pmatrix` 等，编号为 章-序号 |
| 定理环境 | `definition` / `thm` / `lemma` / `corollary` / `remark` / `proof` |
| 图片插入 | `figure` + `\includegraphics`，支持 `subfigure` 并列 |
| 三线表 | `tabularx` + `booktabs`，提供 `L`/`C`/`R` 列类型 |
| 代码高亮 | `lstlisting`，额外支持 `Arduino` 和 `Matlabcs` 语言 |
| 列表 | `itemize` / `enumerate`，行距已压缩 |
| 脚注 | `\footnote`，每页独立编号 |
| 附录 | `appendices` 环境，自动字母编号 |
| 参考文献 | `natbib` + BibTeX，`\bibliography{cite}` 自动生成 |
| 超链接 | `hyperref`，链接颜色为道奇蓝，目录为黑色 |

## 常用命令速查

```latex
% ---- 字体 ----
{\song 宋体}  {\kai 楷体}  {\hei 黑体}  {\fang 仿宋}

% ---- 数学 ----
\begin{equation} ... \end{equation}
\begin{align} ... \end{align}

% ---- 定理 ----
\begin{thm}[定理名] ... \end{thm}
\begin{definition}[定义名] ... \end{definition}
\begin{proof} ... \end{proof}

% ---- 图片 ----
\begin{figure}[H]
    \centering
    \includegraphics[width=0.6\textwidth]{fig/xxx.png}
    \caption{图题}
    \label{fig:xxx}
\end{figure}

% ---- 表格 ----
\begin{table}[H]
    \centering
    \caption{表题}
    \begin{tabularx}{0.8\textwidth}{CCC}
        \toprule
        A & B & C \\
        \midrule
        1 & 2 & 3 \\
        \bottomrule
    \end{tabularx}
\end{table}

% ---- 代码 ----
\begin{lstlisting}[language=C, caption={标题}]
// your code here
\end{lstlisting}

% ---- 附录 ----
\begin{appendices}
\section{附录A标题} ...
\end{appendices}

% ---- 参考文献 ----
\bibliographystyle{unsrtnat}
\bibliography{cite}
```

## 编译器与字体

- **编译器**：必须使用 **XeLaTeX**（`ctexart` + 中文字体需求）
- **中文字体**：默认使用 Fandol 开源字体族（TeX Live 自带），如需更换，修改 `sysu_report.cls` 中对应 `\setCJKxxxfont` 即可
- **英文字体**：Times New Roman / Arial / Courier New（均为 Windows 系统自带）

## `sysu_report.cls` 主要定制项

如需自行调整样式，在 `sysu_report.cls` 中找到对应位置修改：

| 设置 | 位置 | 说明 |
|------|------|------|
| 页边距 | L7 `geometry` | `hmargin` 左右，`vmargin` 上下 |
| 行距 | L11 `\setstretch` | 默认 `1.625`（对应 Word 1.5 倍） |
| 中文字体 | L17-23 | `\setCJKmainfont` 等 |
| 英文字体 | L25-27 | `\setmainfont` 等 |
| 页眉文字 | L33 | 默认"中山大学实验报告模板" |
| 代码颜色 | L150-154 | `keywordcolor` / `commentcolor` / `stringcolor` |
| 链接颜色 | L236 | `linkcolor` / `citecolor` / `urlcolor` |

## 常见问题

**Q: 编译报错 "File `xxx' not found"？**
答：检查 `fig/` 目录下是否有对应图片文件。本模板附带了示例图片，替换为自己的图片即可。

**Q: 字体报错？**
答：Fandol 字体是 TeX Live 自带的，确保安装了 TeX Live 完整版。Windows 下也可将中文字体替换为系统自带字体（如 `SimSun`、`KaiTi` 等），修改 `sysu_report.cls` 中 `\setCJKmainfont` 对应的字体名。

**Q: 参考文献不显示？**
答：确保使用 `latexmk -xelatex` 编译（它会自动跑 bibtex）。手动编译的话需要执行 `xelatex → bibtex → xelatex → xelatex`。

**Q: 如何获取 GB/T 7714 格式的 BibTeX 条目？**
答：百度学术搜索文献 → 点击"引用" → 选择"BibTeX" → 复制粘贴到 `cite.bib`。

## 许可

本模板基于 MIT License 开源，欢迎提 issue 和 PR。
