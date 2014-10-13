#!/bin/bash

# for security
set -u
set -e
clear
cat << EOF
  #######################################
  #                                     #
  #       CocoaPods 一键安装脚本        #
  #                                     #
  #######################################

EOF

# Check TiBird PodSpecs has been installed
if [ "$(cd ~/.cocoapods/repos/master/ && git remote -v | grep tibird.com)" == "" ]; then 

# Remove old cocoapods master

cat << EOF 

==> 正在删除位于大洋彼岸 Github 上的 CocoaPods 源

EOF

pod repo remove master

# Using git.tibird.com as cocoapods master

cat << EOF

==> 正在使用位于北京的 git.tibird.com 上的 CocoaPods 源

EOF

pod repo add master git@git.tibird.com:vendor/podspecs.git

fi

# Goto current folder and execute pod install

cat <<EOF

==> 正在安装 CocoaPods 依赖项目

EOF

cd `dirname $0` && pod install && echo -e "\n==> 安装完成\n" && exit

echo -e "==> 安装失败"
