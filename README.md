### Introduction

This pipeline is designed to detect **runs of homozygosity (ROH)** and **loss 
of heterozygosity (LOH)** regions across large-scale genomic datasets.

### Usage

You can quickly run a localized test checking the full pipeline against bundled
verification records:

```bash
nextflow run genomictools/infer-heterozygosity-loss \
    -r main \
    --output_dir results/ \
    --cohorts input/cohorts_info.csv
```

### Inputs & Parameters

The input to the workflow is a structured, comma-separated samplesheet (`.csv`).

```csv
cohort,key,sample,sample_type,bam,bam_index,vcf,vcf_index
```

### Output

The pipeline generates an organized directory structure under your designated `--outdir`

- `pipeline_info/`: Nextflow runtime, resource, and execution logs
- `tracked_regions/`: Intersected genomic profiles mapping ROH/LOH fragments
- `reports/`: Sample-level summary statistics and analytical plots
