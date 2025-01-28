funnction_name <- function(inputs) {
  output_value <- do_something(inputs)
  return(output_value)
}

# function with a single parameter:
square <- function(x) {
  result <- x^2
  return(result)
}
square(3)
y <- 4
square(y)
square(y + 1)

# function with two parameters
nth_power <- function(x, n) {
  result <- x^n
  return(result)
}
nth_power(3,2)
nth_power(3,4)

gt_threshold <-  function(x, threshold) {
  is_gt <- x > threshold
  result <- sum(is_gt)
  return(result)
}
gt_threshold(c(1, 2, 4), 3)
