#!/bin/bash

#SBATCH -o test/test.out
#SBATCH -e test/test.err
#SBATCH -J test
#SBATCH -p master-worker
#SBATCH -t 120:00:00

# Setup test directory
mkdir -p tests/ tests/input

# # Download dataset
# URL="https://raw.githubusercontent.com/Gabaldonlab/jloh/refs/heads/master/test_data"
# wget -c $URL/S_para.chrXII.fa -O tests/input/S_para.chrXII.fa
# wget -c $URL/out.fs.bam -O tests/input/out.fs.bam
# wget -c $URL/out.fs.bam -O tests/input/out.normal.bam
# wget -c $URL/out.fs.bam.bai -O tests/input/out.fs.bam.bai
# wget -c $URL/out.fs.bam.bai -O tests/input/out.normal.bam.bai
# wget -c $URL/out.ff.vcf -O tests/input/out.ff.vcf
# wget -c $URL/out.ff.vcf -O tests/input/out.normal.vcf
# # touch tests/input/out.ff.vcf.tbi tests/input/out.normal.vcf.tbi

# echo -e "cohort,key,sample,sample_type,bam,bam_index,vcf,vcf_index" > tests/input/cohorts_info.csv
# echo -e "test,S_para_chrXII,out.fs.bam,tumor,input/out.fs.bam,input/out.fs.bam.bai,input/out.ff.vcf,input/out.ff.vcf.tbi" >> tests/input/cohorts_info.csv
# echo -e "test,S_para_chrXII,out.fs.bam,normal,input/out.normal.bam,input/out.normal.bam.bai,input/out.normal.vcf,input/out.normal.vcf.tbi" >> tests/input/cohorts_info.csv

cd tests/

# Run nextflow
module load Nextflow

# nextflow run genomictools/infer-heterozygosity-loss -r main \
nextflow run ../main.nf \
    --output_dir ./results/ \
    -profile local,test \
    -resume

# usage: nextflow run [ local_dir/main.nf | git_url ]  
# These are the required arguments:
#     -r            {main,dev} to run specific branch
#     -profile      {local,cluster} to run using differens resources
#     -params-file  params.json to pass parameters to the pipeline
#     -resume       To resume the pipeline from the last checkpoint
