#!/usr/bin/env nextflow

/*
 * Minimal example demonstrating Azure Batch startTask bug
 * The issue: semicolon concatenation in startTask commands is not parsed by Azure
 * https://github.com/nextflow-io/nextflow/blob/b7fa6f4e0f3d821b0cb9ba17d467dcf5694f47dd/plugins/nf-azure/src/main/nextflow/cloud/azure/batch/AzBatchService.groovy#L838
 */

nextflow.enable.dsl = 2

process TEST_STARTTASK {
    output:
    stdout
    
    script:
    """
    echo "Testing if startTask was executed..."
    if [ -f "\$AZ_BATCH_NODE_SHARED_DIR/startTask_executed.txt" ]; then
        echo "SUCCESS: startTask executed - file exists"
    else
        echo "FAILURE: startTask not executed - file missing"
    fi
    """
}

workflow {
    TEST_STARTTASK() | view
}