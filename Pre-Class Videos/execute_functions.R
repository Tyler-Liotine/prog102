gt_threshold <- function(x, threshold) {
  is_gt <- x > threshold
  result <- sum(is_gt)
  return(result)
}

temperatures <- c(18.1, 29.9, 22.3, 25.2)
gt_threshold(temperatures, 25)

# Dig in with the debugger browser()
gt_threshold <- function(x, threshold) {
  # trigger the debugger
  browser()
  is_gt <- x > threshold
  result <- sum(is_gt)
  return(result)
}
gt_threshold(temperatures, 25)

# changing the parameter values in the function will not change the original
# input
gt_threshold <- function(x, threshold) {
  is_gt <- x > threshold
  result <- sum(is_gt)
  x <- "new x"
  return(result)
}
gt_threshold(temperatures, 25)


# exercise 1
fish_mass <- 5
temperature <- 20
fish_growth <- function(mass, temp) {
  growth <- 3 + 0.2 * temp
  mass <- mass + growth
  return(mass)
}
fish_growth(fish_mass, temperature)

# exercise 2
calc_volume <- function(height, width, depth) {
  area <- height * width
  volume <- area * depth
  return(volume)
}
vol <- calc_volume(3, 5, 1)
area
# function area would not work because it is encapsulated and cannot be found
# separately from the volume function
