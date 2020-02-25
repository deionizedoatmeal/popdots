#!/bin/bash

cd /home/ian

#ls -R | awk '/:$/&&f{s=$0;f=0}/:$/&&!f{sub(/:$/,"");s=$0;f=1;next}NF&&f{ print s"/"$0 }' > triton-files.txt

#sudo ls -R /mnt/neptune/home/ian | awk '/:$/&&f{s=$0;f=0}/:$/&&!f{sub(/:$/,"");s=$0;f=1;next}NF&&f{ print s"/"$0 }' > neptune-files.txt

TRITONCOUNT=$(wc -l < triton-files.txt)

# for each file on triton
for i in {1..$TRITONCOUNT}
do
    ISED=${i}p
    NAME=$(sed -n $ISED triton-files.txt | sed 's:.*/::')
    FULLNAME=$(sed -n $ISED triton-files.txt)

    SEARCHTERM=$/${NAME}$
    COUNT=$(grep -E $SEARCHTERM neptune-files.txt | wc -l)
    if [ $COUNT == 0 ]
    then
        echo $FULLNAME >> transfer-files.txt
    fi

    for j in {1..$COUNT}
    do
        JSED=${j}trp
        DESTNAME=$(grep -E $SEARCHTERM neptune-files.txt | sed -n $JSED)
        echo $DESTNAME
        echo $FULLNAME
        DIFFOUT=$(sudo diff $FULLNAME $DESTNAME)
        if [ "DIFFOUT" == "" ]
        then
            break
        echo $FULLNAME >> transfer-files.txt
        fi
    done
done


