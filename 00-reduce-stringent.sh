#!/bin/bash
#

for fasta in `ls $1*$2`
	do 
	docker run -v `pwd`:/runbox:rw -it lpryszcz/redundans bash -c \
	"cd runbox && /root/src/redundans/redundans.py -v --identity 0.95 --overlap 1.0 \
	-t 30 --noscaffolding --nogapclosing --minLength 100 \
	-f $fasta -o $(basename ${fasta} .$2)_reduced_stringent \
	&& chown -R 1024:1024 /runbox"
done


