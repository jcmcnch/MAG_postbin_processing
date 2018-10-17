# MAG_postbin_processing

This is a collection of wrapper scripts for processing metagenome-assembled genomes (MAGs). The goals are to:

1. Rescue bins that have high contamination that is composed of strain variation. Redundans is the tool of choice for this analysis. This can significantly improve the number of high quality bins from a given binning dataset. For example, with a bin set derived from David's time-series data, redundans increased the number of high quality bins (here defined as >50% complete and <10% contaminated) from 17 to 30. 

2. Create a non-redundant set of bins that capture the best results from different binning software but do not include redundant portions of genomes. dRep is the tool of choice here.
