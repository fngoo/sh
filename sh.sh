#!/bin/bash
echo "Correcting script file formats"
for file in *.sh
do
    echo $file
    sed -i 's/\r//' $file
    chmod +x $file
done
