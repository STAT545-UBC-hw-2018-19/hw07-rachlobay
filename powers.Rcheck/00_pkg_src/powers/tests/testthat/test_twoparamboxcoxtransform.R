context("Two parameter box cox transformations for different x and lambda1 and lambda2.")

test_that("positive, zero, or negative lambda1 and lambda2 work", {
    x = 1:10
    lambda4 = 4
    lambda5 = 5
    lambda_neg4 = -4
    lambda_neg5 = -5
    lambda0 = 0
    lambda_neg20 = -20

    # two positive lambdas
    expect_identical(two.param.boxcox.transform(x,lambda4, lambda5), BIGL:::boxcox.transformation(x,lambda4, lambda5))
    # one positive and one negative lambda
    expect_identical(two.param.boxcox.transform(x,lambda4, lambda_neg5), BIGL:::boxcox.transformation(x,lambda4, lambda_neg5))
    expect_identical(two.param.boxcox.transform(x,lambda_neg4, lambda5), BIGL:::boxcox.transformation(x,lambda_neg4, lambda5))
    # two negative lambdas
    expect_identical(two.param.boxcox.transform(x,lambda_neg4, lambda_neg5), BIGL:::boxcox.transformation(x,lambda_neg4, lambda_neg5))
    # one zero lambda
    expect_identical(two.param.boxcox.transform(x,lambda0, lambda_neg5), BIGL:::boxcox.transformation(x,lambda0, lambda_neg5))
    expect_identical(two.param.boxcox.transform(x,lambda_neg4, lambda0), BIGL:::boxcox.transformation(x,lambda_neg4, lambda0))
    # two zero lambdas
    expect_identical(two.param.boxcox.transform(x), BIGL:::boxcox.transformation(x, lambda0, lambda0))
})


test_that("negative x vector automatically converted to positive.", {
    x = -5:5
    lambda1 = 1
    lambda_neg1 = -1

    expect_identical(two.param.boxcox.transform(x,lambda1, lambda_neg1), BIGL:::boxcox.transformation(x+6,lambda1, lambda_neg1))
})

test_that("negative x vector converted to positive when makepos is specified.", {
    x = -5:5
    lambda1 = 1
    lambda_neg1 = -1
    makepos = 7

    expect_identical(two.param.boxcox.transform(x,lambda1, lambda_neg1, makepos = 7), BIGL:::boxcox.transformation(x+7,lambda1, lambda_neg1))
})
