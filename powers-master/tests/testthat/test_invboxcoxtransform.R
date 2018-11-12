install.packages("bimixt", version = "1.0", repos = "http://cran.us.r-project.org")
library(bimixt) # to access boxcox.inv() function
context("Inverse box cox transformations for different x and lambdas.")

test_that("a single positive, zero, or negative lambda works.", {
    x = 1:10
    lambda4 = 4
    lambda0 = 0
    lambda_neg20 = -20

    expect_identical(inv.boxcox.transform(x,lambda4), boxcox.inv(x,lambda4))
    expect_identical(inv.boxcox.transform(x,lambda0), boxcox.inv(x,lambda0))
    expect_identical(inv.boxcox.transform(x,lambda_neg20 ), boxcox.inv(x,lambda_neg20))
})


test_that("a vector of lambda values works.", {
    x = 1:5
    lambda_vec_02 <- c(0, 2)
    lambda_vec_12345 <- c(-1,2,3,4,5,5)

    # can only check that the outputs for different lambdas are the same as vectors b/c boxcox.inv() does not give an output of the values corresponding to the different lambdas in a matrix.
    # check values corresponding to lambda = 0 element in lambda_vec_02 vector
    expect_identical(inv.boxcox.transform(x,lambda_vec_02[1]), boxcox.inv(x, lambda_vec_02[1]))
    # check values corresponding to lambda = 2 element in lambda_vec_02 vector
    expect_identical(inv.boxcox.transform(x,lambda_vec_02[2]), boxcox.inv(x, lambda_vec_02[2]))

    # check values corresponding to lambda = -1 element in lambda_vec_12345 vector
    expect_identical(inv.boxcox.transform(x,lambda_vec_12345[1]), boxcox.inv(x, lambda_vec_12345[1]))
    # check values corresponding to lambda = 2 element in lambda_vec_12345 vector
    expect_identical(inv.boxcox.transform(x,lambda_vec_12345[2]), boxcox.inv(x, lambda_vec_12345[2]))
    # check values corresponding to lambda = 3 element in lambda_vec_12345 vector
    expect_identical(inv.boxcox.transform(x,lambda_vec_12345[3]), boxcox.inv(x, lambda_vec_12345[3]))
    # check values corresponding to lambda = 4 element in lambda_vec_12345 vector
    expect_identical(inv.boxcox.transform(x,lambda_vec_12345[4]), boxcox.inv(x, lambda_vec_12345[4]))
    # check values corresponding to lambda = 5 element in lambda_vec_12345 vector
    expect_identical(inv.boxcox.transform(x,lambda_vec_12345[5]), boxcox.inv(x, lambda_vec_12345[5]))
    # check values corresponding to second lambda = 5 element in lambda_vec_12345 vector
    expect_identical(inv.boxcox.transform(x,lambda_vec_12345[6]), boxcox.inv(x, lambda_vec_12345[6]))
})


test_that("a vector of negative x values will be made positive automatically and manually by inv.boxcox.transform.", {
    x = -5:5
    lambda_2 <- 2
    makepos = 9

    expect_identical(inv.boxcox.transform(x,lambda_2), boxcox.inv(x+6, lambda_2))
    expect_identical(inv.boxcox.transform(x,lambda_2, makepos=9), boxcox.inv(x+9, lambda_2))
})

