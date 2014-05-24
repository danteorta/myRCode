
# Get the column names
features = read.table('features.txt')

# Read the train and test data
testData = read.table('test/X_test.txt', col.names = features[,2])
trainData = read.table('train/X_train.txt', col.names = features[,2])

# Merge the train and test data into one dataset
allData = rbind(testData, trainData)

# Extract columns with mean and stds
cindex = sort(c(grep("std", features[,2], 2), grep("mean", features[,2], 2)))
# Columns of Jerk and Fourier signals (Not want them)
dropCols = c(grep("Jerk", features[,2]), grep("fBody", features[,2]))
cindex = cindex[!(cindex %in% dropCols)]

# Get the final columns to be used
cleanData = allData[, cindex]

