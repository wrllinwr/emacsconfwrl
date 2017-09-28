# emacsconfwrl
emacs配置,用于自学及备份。
#环境
我自己的环境是MacOS sierra,GUN Emacs 24.4.1
安装过GUN Global 6.5.6

#主要特点
本配置参照“子龙山人”第二季视频配置学习，按照自身使用习惯部分功能未参考。
plain-text基本配置完成，C、Python环境基本配置完成,其中PythonIDE并不理
想。Java Ruby指定语言未开始配置。额外增加了自己比较喜欢的功能:
		 1.目前主要针对Python IDE做一了些定制，都是源于互联网的知识。
		 2.可以在EMACS中执行单个程序。
		 3.使用了有道在线翻译。
		 4.使用了stardict离线词典。

#install
首先需要安装emacs,我的版本是GNU Emacs 24.4.1。
git clone https://github.com/wrllinwr/emacsconfwrl.git

将emacsconfwrl目录下的内容拷贝到你的.emacs.d目录中，并且删除
	~/.emacs文件

如果你已有自己的emacs可以是用如下命令启动：
emacs -q -l path-to/emacsconfwrl/init.el

#使用
	主要查看init-keybindings.el即可大致了解该配置都使用了哪些扩展包，
及其所提供的功能。

#未实现或者是还不会使用的地方
	参照eclipse、pycharm、Source Insight。
	使自己使用EMACS更加灵活方便，包括工程代码阅读搜索启动断点调试。

#BUG
1.[已消失]在启动emacs时时间会特别长，大概1分钟左右。
	问题已经消失，原因不知道。只是把monokai主题卸载了，重新安装auto-complete。
	之前用的GUN Emacs 24.5.1在逐步配置的过程中出现启动时间长的问题，现在已经
	改为GUN Emacs 24.4.1

2.[未解决]TAB的代码缩进优化会影响helm-gtags自动加载。