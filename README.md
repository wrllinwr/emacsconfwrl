# emacsconfwrl
我自己的emacs配置,用于自学及备份。本人英语超烂所以用方块字编辑本文。
本配置参照“子龙山人”第二季视频配置学习，按照自身的实用习惯部分功能未参考。
截止2017-02-13配置到第二季第7集。
额外增加了两个自己比较喜欢的功能:

    1.M-up 将本行向上移动。已知BUG：当前行移动到格式化区域(缩进区域)被移动的行保持自身缩进
    (global-set-key [(meta up)] 'move-text-line-up) 
    
    2.M-down 将本行向下移动。已知BUG：当前行移动到格式化区域(缩进区域)被移动的行保持自身缩进
    (global-set-key [(meta down)] 'move-text-line-down)
    
    3.C-RET 在当前行下方新建行（C-o 调用open-line函数，即在当前行上方新建行。也许是我没有找到emacs自身带的快捷键）
            实现原理利用C-e + RET。
    (global-set-key [(control return)] '(lambda()
				      (interactive)
				      (move-end-of-line 1)
				      (message "end of the line")
				      (newline)))
    
