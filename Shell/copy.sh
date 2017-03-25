#!/bin/bash  
#递归复制一个文件夹下的所有文件到另一个文件夹
function recursive_copy_file()  
{  
    dir_list=$(ls $1)  
    for name in ${dir_list[*]}  
    do  
        if [ -f $1/$name ]; then  
            # 如果是文件，并且$2不存在该文件，则直接copy  
            if [ ! -f $2/$name ]; then  
                cp $1/$name $2/$name  
            fi  
        elif [ -d $1/$name ]; then  
            # 如果是目录，并且$2不存在该目录，则先创建目录  
            if [ ! -d $2/$name ]; then  
                mkdir -p $2/$name  
            fi  
            # 递归拷贝  
            recursive_copy_file $1/$name $2/$name  
        fi  
    done  
}  

source_dir="./03.14_diplexer"  
dest_dir="./diplexer_git/diplexer/"  
  
recursive_copy_file $source_dir $dest_dir  