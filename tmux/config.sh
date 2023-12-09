#/bin/bash

if [-f "$HOME/.tmux.conf" ]; then
    rm "$HOME/.tmux.conf" -rf
fi


# 获取脚本所在的目录
script_dir=$(dirname "$0")

# 将相对路径转换为绝对路径
script_dir_abs=$(cd "$script_dir"; pwd)

ln -s "$script_dir_abs/tmux.conf" "$HOME/.tmux.conf"


