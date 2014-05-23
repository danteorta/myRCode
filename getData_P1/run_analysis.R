
# Get the column names
features = read.table('features.txt')

# Read the train and test data
testData = read.table('test/X_test.txt', col.names = features[,2])
trainData = read.table('train/X_train.txt', col.names = features[,2])

# Merge the train and test data into one dataset
allData = rbind(testData, trainData)

# Extract columns with mean and stds
cindex = sort(c(grep("std", features[,2], 2), grep("mean", features[,2], 2)))
usefulCols = features[sort(c(grep("std", features[,2], 2), grep("mean", features[,2], 2))), 2]
cleanData = allData[, cindex]