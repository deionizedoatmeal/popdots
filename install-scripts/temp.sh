echo "############### SCRIPTS ################"

cd ../scripts
for f in *.sh; do
        echo "########## "
        echo $f
        diff $f ~/Repos/dots/scripts/$f
done

for f in *.py; do
        echo "########## "
        echo $f
        diff $f ~/Repos/dots/scripts/$f
done
