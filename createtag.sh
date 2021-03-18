#!/bin/bash
echo 'please tag name'：
read tagName
if [ ! $tagName ]; 
then 
    echo 'fail:tagName is not empty'
else
    echo 'please tag desc'：
    read tagdesc
    if [ ! $tagdesc ]; 
    then
        echo 'fail:tagdesc is not empty'
    else 
    echo "your enter tag: $tagName"
    echo "your enter tagdesc: $tagdesc"
    git tag -a $tagName -m $tagdesc
    if [ $? -ne 0 ]; 
    then
    echo "git create tag failed!"
    else
    echo -e "\033[32;40mgit create tag success！\033[0m"
    git push origin $tagName
    if [ $? -ne 0 ]; 
    then 
    echo "git push origin $tagName failed!"
    else 
    # echo "git push origin $tagName success!"
    echo -e "\033[32;40mgit push origin $tagName success!\033[0m"
    echo "current all tag :" 
    git tag 
    fi
    fi
    
    fi

    echo "done"
fi

