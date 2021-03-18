#!/bin/bash
echo 'please tag name'：
read tagName
echo 'please tag desc'：
read tagdesc
echo "your enter tag: $tagName"
echo "your enter tagdesc: $tagdesc"
git tag -a $tagName -m $tagdesc
git push origin $tagName
echo "create $tagName success!"
echo "current tag list:" 
git tag 
echo "done()"
