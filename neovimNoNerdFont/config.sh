#!/bin/bash
if [ ! -d "$HOME/.config" ]; then
    mkdir -p "$HOME/.config"
fi
# 获取脚本所在的目录
script_dir=$(dirname "$0")

# 将相对路径转换为绝对路径
script_dir_abs=$(cd "$script_dir"; pwd)
echo $script_dir_abs

if [ -d "$HOME/.config/nvim" ]; then
    rm -rf "$HOME/.config/nvim"
fi

ln -s "$script_dir_abs/nvim" "$HOME/.config/nvim"
