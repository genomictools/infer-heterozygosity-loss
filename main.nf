#!/usr/bin/env nextflow

nextflow.enable.dsl=2

include { infer_loss }      from './subworkflows/infer_loss.nf'

workflow  {
    vcf_ch = Channel.fromPath(params.cohorts)
        | splitCsv(header: true, sep: ',')
        | map { row -> [ 
            row.cohort, row.key, row.sample, row.sample_type,
            file(row.vcf), file(row.vcf_index)
        ] }

    bam_ch = Channel.fromPath(params.cohorts)
        | splitCsv(header: true, sep: ',')
        | map { row -> [ 
            row.cohort, row.key, row.sample, row.sample_type,
            file(row.bam), file(row.bam_index)
        ] }

    loh = infer_loss(vcf_ch, bam_ch)
}
