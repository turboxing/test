#!/bin/bash
# echo 'please tag name'：
# read tagName
# if [ ! $tagName ]; 
# then 
#     echo 'fail:tagName is not empty'
# else
#     echo 'please tag desc'：
#     read tagdesc
#     if [ ! $tagdesc ]; 
#     then
#         echo 'fail:tagdesc is not empty'
#     else 
#     echo "your enter tag: $tagName"
#     echo "your enter tagdesc: $tagdesc"
#     git tag -a $tagName -m $tagdesc
#     if [ $? -ne 0 ]; 
#     then
#     echo "git create tag failed!"
#     else
#     echo -e "\033[32;40mgit create tag success！\033[0m"
#     git push origin $tagName
#     if [ $? -ne 0 ]; 
#     then 
#     echo "git push origin $tagName failed!"
#     else 
#     # echo "git push origin $tagName success!"
#     echo -e "\033[32;40mgit push origin $tagName success!\033[0m"
#     echo "current all tag :" 
#     git tag 
#     fi
#     fi
    
#     fi

#     echo "done"
# fi


#  遍历文件内容，找到s.verison 开始的行，用新的内容替换；exit 是关闭程序

function updatePodVersion(){
    while read LINE
do
	#记录行数
	let count++
	#打印行号及其内容
	echo "$count - $LINE"

    result=$(echo $LINE | grep "s.version") 
    echo $result
    if [ "$result" != "" ]
    then 
        echo "包涵"
        a='a'
        d='d'
        sed '1a drink tea' Podfile
        sed "$(LINE)d" Podfile
    exit
    else
        echo "no"
    fi
done < Podfile

#     podFileContent=$(cat Podfile)
#     echo $podFileContent
#     strB="2.1.4"

# result=$(echo $podFileContent | grep "${strB}") 

# if [[ "$result" != "" ]]
# then
#     echo "包含"
# else
#     echo "不包含"
# fi
}
updatePodVersion
