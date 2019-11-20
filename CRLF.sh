#!/bin/bash
#换行符导致报错，手动复制到新文件执行
echo "Correcting script file formats"
for file in *.sh
do
    echo $file
    sed -i 's/\r//' $file
    chmod +x $file
done
