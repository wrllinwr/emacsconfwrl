# emacsconfwrl
emacs配置,用于自学及备份。
#环境
我自己的环境是MacOS sierra,GUN Emacs 24.5.1
安装过GUN Global 6.5.6

#特性
本配置参照“子龙山人”第二季视频配置学习，按照自身的实用习惯部分功能未参考。
基本配置完成，C环境基本配置完成,Java Python Ruby Lisp指定语言未开始配置。
额外增加了两个自己比较喜欢的功能:

    1.M-up 将本行向上移动。
    (global-set-key [(meta up)] 'move-text-line-up)
	(defun move-line-up()
		   "Moves current line up."
  		   (interactive)
  		   (transpose-lines 1)
		   (previous-line)
		   (previous-line)
		   (indent-for-tab-command))
    
    2.M-down 将本行向下移动。
    (global-set-key [(meta down)] 'move-text-line-down)
    (defun move-line-down ()
		   "Moves current line down."
 		    (interactive)
  			(move-text-line-down)
  			(indent-for-tab-command))
    3.C-RET 在当前行下方新建行（C-o 调用open-line函数，即在当前行上方新建行。也许是我没有找到emacs自身带的快捷键）
            实现原理利用C-e + RET + （indent-for-tab-command)。
			(global-set-key [(control return)] '(lambda()
				      (interactive)
				      (move-end-of-line 1)
				      (message "end of the line")
				      (newline)
					  (indent-for-tab-command)
					  ))
    
#install
首先需要安装emacs,我的版本是GNU Emacs 24.5.1。
git clone https://github.com/wrllinwr/emacsconfwrl.git

将emacsconfwrl目录下的内容拷贝到你的.emacs.d目录中，并且删除
	~/.emacs文件

如果你已有自己的emacs可以是用如下命令启动：
emacs -q -l path-to/emacsconfwrl/init.el

#BUG
1.在启动emacs时时间会特别长，大概1分钟左右.
	问题已经消失，原因不知道。只是把主题关闭了，重新安装auto-complete