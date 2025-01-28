library(marinecs100b)

# Extracting data ---------------------------------------------------------

# How did you extract the temperature and exposure from the hottest day?
# Copy-paste the code here.
hottest_idx <- which.max(kefj_temperature)
hottest_time <- kefj_datetime[hottest_idx]
hottest_site <- kefj_site[hottest_idx]
hotday_start <- as.POSIXct("2018-07-03 0:00:00", tz = "Etc/GMT+8")
hotday_end <- as.POSIXct("2018-07-03 23:59:59", tz = "Etc/GMT+8")
hotday_idx <- kefj_site == hottest_site &
  kefj_datetime >= hotday_start &
  kefj_datetime <= hotday_end
hotday_datetime <- kefj_datetime[hotday_idx]
hotday_temperature <- kefj_temperature[hotday_idx]
hotday_exposure <- kefj_exposure[hotday_idx]

# If you want to change the site and date, what variables would need to change?
# You would want to change site, date, and index

# What would you pick for the temperature extraction function name and parameter
# names?
extract_temp

# Writing extraction functions --------------------------------------------

# Write your temperature extraction function here
extract_temp <- function(site, date) {
  date <- as.POSIXct(date, tz = "Etc/GMT+8")
  day_start <- date
  day_end <-  date + 86400
  temp_idx <- kefj_site == site & kefj_datetime >= day_start & kefj_datetime <= day_end
  site_temps <- kefj_temperature[temp_idx]
  return(site_temps)
}

# Write your exposure extraction function here
site_exposure <- function(site, date) {
  date <- as.POSIXct(date, tz = "Etc/GMT+8")
  day_start <- date
  day_end <-  date + 86400
  exp_idx <- kefj_site == site & kefj_datetime >= day_start & kefj_datetime <= day_end
  site_exp <- kefj_exposure[exp_idx]
  return(site_idx)
}

# Write your datetime extraction function here
get_dates <- function(site, date) {
  date <- as.POSIXct(date, tz = "Etc/GMT+8")
  day_start <- date
  day_end <-  date + 86400
  datetime_idx <- kefj_site == site & kefj_datetime >= day_start & kefj_datetime <= day_end
  datetimes <- kefj_datetime[datetime_idx]
  return(datetimes)
}

# Visualize Aialik temperatures on 2012-06-01
Aialik_temp <- extract_temp("Aialik", "2012-06-01")
Aialik_datetime <- get_dates("Aialik", "2012-06-01")
plot(Aialik_datetime, Aialik_temp)

# Visualize Nuka_Pass temperatures on 2018-07-01
Nuka_Pass_temp <- extract_temp("Nuka_Pass", "2012-06-01")
Nuka_Pass_datetime <- get_dates("Nuka_Pass", "2012-06-01")
plot(Nuka_Pass_datetime, Nuka_Pass_temp)

# How does the visualization code above compare to what you wrote in PROG101?


# Functions within functions (optional) -----------------------------------

# How would you parameterize the visualization code into its own function?
# Specifically, what would you call that function and its parameters?

# Write your wrapper function for plot_kefj(). Call it to compare the
# visualizations for Nuka Pass on July 1, 2018 versus January 1, 2018.
