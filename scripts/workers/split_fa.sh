#!/usr/bin/env bash

#PBS -W group_list=bhurwitz
#PBS -q standard
#PBS -l select=1:ncpus=1:mem=3gb
#PBS -l walltime=2:00:00
#PBS -l cput=2:00:00
#PBS -M scottdaniel@email.arizona.edu
#PBS -m bea

echo Host `hostname`

echo Started `date`

source activate py36

cd $PRJ_DIR

#Example:
#faSplit sequence estAll.fa 100 est
#This will break up estAll.fa into 100 files
#(numbered est001.fa est002.fa, ... est100.fa
#Files will only be broken at fa record boundaries

faSplit sequence SPAdes_Day0_Erio_8-18-contigs.fasta 2 SPAdes_Day0_Erio_8-18-contigs

echo Finished `date`
