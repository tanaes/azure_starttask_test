# Azure Batch startTask bug minimal example

This repo should be a minimal example for demonstrating that the startTask directive for Azure Batch pools is failing silently under default operation. 

## Default behavior (FAILS):

```bash
nextflow run main.nf \
  --storage_name $AZURE_STORAGE_ACCOUNT \
  --storage_key $AZURE_STORAGE_KEY \
  --batch_name $AZURE_BATCH_ACCOUNT \
  --batch_key $AZURE_BATCH_KEY \
  -w "az://nextflow-data/projects/test/starttask_test/work" 
```

Output: `FAILURE: startTask not executed - file missing`

## With workaround (WORKS):

```bash
nextflow run main.nf \
  --storage_name $AZURE_STORAGE_ACCOUNT \
  --storage_key $AZURE_STORAGE_ACCOUNT_KEY \
  --batch_name $AZURE_BATCH_ACCOUNT \
  --batch_key $AZURE_BATCH_ACCOUNT_KEY \
  -w "az://nextflow-data/projects/test/starttask_test/work" \
  --copyToolInstallMode task
```

Output: `SUCCESS: startTask executed - file exists`
