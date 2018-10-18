#!/bin/bash
#Run in folder containing your bins, as follows:
# 00-reduce-stringent.sh <file extension of bins, e.g. fa, fasta> <dataset_ID> <binner>

if [[ ${#1} -eq 0 ]] ; then
    echo 'Please enter a file extension as the first argument after the script name. Example 00-reduce-stringent.sh fa sampleID binner'
    exit 0
fi

if [[ ${#2} -eq 0 ]] ; then
    echo 'Please enter a name of your dataset as the second argument after the script name. Example 00-reduce-stringent.sh fa SPOT_2009_2014 binner'
    exit 0
fi

if [[ ${#3} -eq 0 ]] ; then
    echo 'Please enter a the name of your binner as the third argument after the script name. Example 00-reduce-stringent.sh fa SPOT_2009_2014 binner'
    exit 0
fi

for fasta in `ls *$1`

	do 
	
	docker run --rm -v `pwd`:/runbox:rw -it lpryszcz/redundans bash -c \
	"cd runbox && /root/src/redundans/redundans.py -v --identity 0.95 --overlap 1.0 \
	-t 30 --noscaffolding --nogapclosing --minLength 100 \
	-f $fasta -o $(basename ${fasta} .$1)_reduced_stringent \
	&& chown -R `id -u $USER`:`id -u $USER` /runbox"
	
done

mkdir intermediate_redundans
mkdir original_bins
mkdir reduced_bins

for item in `find -mindepth 1 -maxdepth 1 -type d | grep reduced_stringent`
	
	do
	
	cp $item/contigs.reduced.fa $2-$3-`basename $item`.fa
	mv $item intermediate_redundans
	
done

mv *fai intermediate_redundans
mv *reduced_stringent.fa reduced_bins
mv *fa original_bins
