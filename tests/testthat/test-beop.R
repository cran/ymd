test_that("period_begin returns right begining date", {
  dates <- seq.Date(from = as.Date("2016-03-07") - 1, to = as.Date("2016-03-13") + 1, by = "1 day")

  # check both integer dates and double dates
  dates_int <- structure(as.integer(dates), class = "Date")
  out <- period_begin(dates_int, unit = "week") == as.Date("2016-03-07")
  expect_equal(out, c(FALSE, rep(TRUE, length(out) - 2L), FALSE))

  dates_real_ints <- as.integer(format(dates, "%Y%m%d"))
  out <- period_begin(dates_real_ints, unit = "week") == as.Date("2016-03-07")
  expect_equal(out, c(FALSE, rep(TRUE, length(out) - 2L), FALSE))

  dates_dbl <- structure(as.numeric(dates), class = "Date")
  out <- period_begin(dates_dbl, unit = "week") == as.Date("2016-03-07")
  expect_equal(out, c(FALSE, rep(TRUE, length(out) - 2L), FALSE))

  # other checks: such as month, quarter, year
  dates <- seq.Date(from = as.Date("2015-01-01") - 1, to = as.Date("2015-01-31") + 1, by = "1 day")
  out <- period_begin(dates, unit = "month") == as.Date("2015-01-01")
  expect_equal(out, c(FALSE, rep(TRUE, length(out) - 2L), FALSE))

  dates <- seq.Date(from = as.Date("2015-04-01") - 1, to = as.Date("2015-06-30") + 1, by = "1 day")
  out <- period_begin(dates, unit = "quarter") == as.Date("2015-04-01")
  expect_equal(out, c(FALSE, rep(TRUE, length(out) - 2L), FALSE))

  dates <- seq.Date(from = as.Date("2015-01-01") - 1, to = as.Date("2015-12-31") + 1, by = "1 day")
  out <- period_begin(dates, unit = "year") == as.Date("2015-01-01")
  expect_equal(out, c(FALSE, rep(TRUE, length(out) - 2L), FALSE))
})

test_that("period_end returns right end date", {
  dates <- seq.Date(from = as.Date("2016-03-07") - 1, to = as.Date("2016-03-13") + 1, by = "1 day")
  out <- period_end(dates, unit = "week") == as.Date("2016-03-13")
  expect_equal(out, c(FALSE, rep(TRUE, length(out) - 2L), FALSE))

  dates <- seq.Date(from = as.Date("2015-01-01") - 1, to = as.Date("2015-01-31") + 1, by = "1 day")
  out <- period_end(dates, unit = "month") == as.Date("2015-01-31")
  expect_equal(out, c(FALSE, rep(TRUE, length(out) - 2L), FALSE))

  dates <- seq.Date(from = as.Date("2015-04-01") - 1, to = as.Date("2015-06-30") + 1, by = "1 day")
  out <- period_end(dates, unit = "quarter") == as.Date("2015-06-30")
  expect_equal(out, c(FALSE, rep(TRUE, length(out) - 2L), FALSE))

  dates <- seq.Date(from = as.Date("2015-01-01") - 1, to = as.Date("2015-12-31") + 1, by = "1 day")
  out <- period_end(dates, unit = "year") == as.Date("2015-12-31")
  expect_equal(out, c(FALSE, rep(TRUE, length(out) - 2L), FALSE))
})

test_that("bop / eop auto converts the input to date first", {
  expect_equal(bop$ty(980301), ymd(980101))
  expect_equal(eop$ty(980301), ymd(981231))
})
