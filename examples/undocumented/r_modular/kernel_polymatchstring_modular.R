library(shogun)

fm_train_dna <- as.matrix(read.table('../data/fm_train_dna.dat'))
fm_test_dna <- as.matrix(read.table('../data/fm_test_dna.dat'))

# poly_match_string
print('PolyMatchString')

feats_train <- StringCharFeatures("DNA")
dump <- feats_train$set_features(feats_train, fm_train_dna)
feats_test <- StringCharFeatures("DNA")
dump <- feats_test$set_features(feats_test, fm_test_dna)
degree <- as.integer(3)
inhomogene <- FALSE

kernel <- PolyMatchStringKernel(feats_train, feats_train, degree, inhomogene)

km_train <- kernel$get_kernel_matrix()
dump <- kernel$init(kernel, feats_train, feats_test)
km_test <- kernel$get_kernel_matrix()
