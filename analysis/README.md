# README code and data

To reproduce the analysis for this project you need to run three jupyter notebooks. 

Run them in this order: census, bookData, publicLibraryComparison. Cluster analysis was done in R and that file is in bookData/cluster. It can be run after bookData.

The publicLibraryComparison creates a very large data file and the cleaned up version with data only relevant to this study is included in the folder.

Code used for this project is in the following folders:

- bookData: All the data and code to analyze the contents of LFLs. This created figures 2 and 3.
- census: All the data and code to retrieve and analyze census data
- publicLibraryComparison: All the data and code to retrieve and analyze public library information. This creates figure 5.
- bookData/cluster: R Code for cluster analysis and creates figure 4.