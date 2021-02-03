$ cd C:/Users/melin/Classes/EBIO-4420/CompBioLabsAndHW/Labs/Lab002
$cut -f 2-4 -d, PredPreyData.csv > PredPreySpecificColumns.csv
$grep "prey" PredPreySpecificColumns.csv > firstrow.csv
$tail PredPreySpecificColumns.csv > lasttenrows.csv
$cat firstrow.csv lasttenrows.csv > combinedrows.csv


