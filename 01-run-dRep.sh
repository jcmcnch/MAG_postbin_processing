#!/bin/bash
source activate dRep-env

dRep dereplicate_wf ./dRep_working_directory -p 8 --skipCheckM -sa 0.95 -g input_bins_dRep/*fa

source deactivate
