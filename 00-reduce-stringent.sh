#!/bin/bash
#Run in folder containing your bins, as follows:
# 00-reduce-stringent.sh <file extension of bins, e.g. fa, fasta> <dataset_ID> <binner>

#for fasta in `ls *$1`
#
#	do 
#	
#	docker run -v `pwd`:/runbox:rw -it lpryszcz/redundans bash -c \
#	"cd runbox && /root/src/redundans/redundans.py -v --identity 0.95 --overlap 1.0 \
#	-t 30 --noscaffolding --nogapclosing --minLength 100 \
#	-f $fasta -o $(basename ${fasta} .$1)_reduced_stringent \
#	&& chown -R 1024:1024 /runbox"
#	
#done

mkdir intermediate
mkdir original_bins
mkdir reduced_bins

for item in `find -mindepth 1 -maxdepth 1 -type d | grep reduced_stringent`
	
	do
	
	echo cp $item/contigs.reduced.fa $2`basename $item`.fa
	echo mv $item intermediate
	
done

echo mv *fai intermediate
