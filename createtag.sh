#!/bin/bash
# 1. 输入tag名字和描述
# 2. 替换podSpoec中的版本号
# 3. 打tag
# 4. push tag 到远端
#  遍历文件内容，找到s.verison 开始的行，用新的内容替换；exit 是关闭程序
# todo： 需要判断是否替换成功，如果执行失败，需要还原podfile文件


function updatePodSpecVersion(){
    temTagName=$1
# 匹配+s.version开头的内容然后替换
 sed -i '' "/^[[:space:]]s.version/c\
\    \s.version = '$temTagName'
" Podfile
if [ $? -ne 0 ];
then
return -1;
else
return 0;
fi
}

echo 'please tag name'：
read tagName
if [ ! $tagName ];
then
    echo 'fail:tagName is not empty'
    exit
fi


echo 'please tag desc'：
read tagdesc
if [ ! $tagdesc ];
then
    echo 'fail:tagdesc is not empty'
    exit
fi
 
    echo "your enter tag: $tagName"
    echo "your enter tagdesc: $tagdesc"
    echo "start update PodSpec Version"

    updatePodSpecVersion $tagName
    if [ $? -ne 0 ];
    then
    echo " update PodSpec Version fail"
    exit
    fi

    echo -e "\033[32;40mupdate PodSpec Version success!\033[0m"

    echo "start create tag"
    git tag -a $tagName -m $tagdesc
    if [ $? -ne 0 ];
    then
    echo "git create tag failed!"
    exit
    fi

    echo -e "\033[32;40mgit create tag success！\033[0m"
    echo "start push tag to origin"
    git push origin $tagName
    if [ $? -ne 0 ];
    then
    echo "git push origin $tagName failed!"
    exit
    fi

    echo -e "\033[32;40mgit push $tagName to origin  success!\033[0m"

    echo "current all tag :"
    git tag

    echo "done"

