context("Box cox transformations for different x and lambdas.")


test_that("a single postive, zero, or negative lambda works", {
    x = 1:10
    lambda4 = 4
    lambda0 = 0
    lambda_neg20 = -20

    expect_identical(boxcox.transform(x,lambda4), car:::bcPower(x,lambda4))
    expect_identical(boxcox.transform(x,lambda0), car:::bcPower(x,lambda0))
    expect_identical(boxcox.transform(x,lambda_neg20 ), car:::bcPower(x,lambda_neg20))
})


test_that("a vector of lambda values works.", {
    x = 1:5
    lambda_vec_02 <- c(0, 2)
    lambda_vec_12345 <- c(-1,2,3,4,5)

    expect_identical(boxcox.transform(x,lambda_vec_02), car:::bcPower(matrix(rep(x,length(lambda_vec_02)), ncol = length(lambda_vec_02)),lambda_vec_02))
    expect_identical(boxcox.transform(x,lambda_vec_12345), car:::bcPower(matrix(rep(x,length(lambda_vec_12345)), ncol = length(lambda_vec_12345)),lambda_vec_12345))
})


test_that("a vector of lambda values works.", {
    x = 1:5
    lambda_vec_02 <- c(0, 2)
    lambda_vec_12345 <- c(-1,2,3,4,5)

    expect_identical(boxcox.transform(x,lambda_vec_02), car:::bcPower(matrix(rep(x,length(lambda_vec_02)), ncol = length(lambda_vec_02)),lambda_vec_02))
    expect_identical(boxcox.transform(x,lambda_vec_12345), car:::bcPower(matrix(rep(x,length(lambda_vec_12345)), ncol = length(lambda_vec_12345)),lambda_vec_12345))
})

test_that("a vector of negative x values will be made positive automatically and manually by boxcox.transform.", {
    x = -5:5
    lambda_2 <- 2
    makepos = 9

    expect_identical(boxcox.transform(x,lambda_2), car:::bcPower(x+6, lambda_2))
    expect_identical(boxcox.transform(x,lambda_2, makepos=9), car:::bcPower(x+9, lambda_2))
})
