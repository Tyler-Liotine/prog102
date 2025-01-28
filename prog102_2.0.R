library(marinecs100b)


# Writing a utility function ----------------------------------------------

# P1: How did you extract the temperature and exposure from the hottest day?
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
plot_kefj(hotday_datetime, hotday_temperature, hotday_exposure)

# P2: Fill in the blanks below to write the Alaskan datetime utility function.
get_datetime <- function(date) {
  day_start <- as.POSIXct(date, tz = "Etc/GMT+8")
    return(day_start)
}

# Extracting data ---------------------------------------------------------

# P3: Make a copy of your code from P1 and edit it to plot the temperature and
# exposure for "Aialik" on 2012-06-01
Aialik_start <- as.POSIXct("2012-06-01 0:00:00", tz = "Etc/GMT+8")
Aialik_end <- as.POSIXct("2012-06-06 23:59:59", tz = "Etc/GMT+8")
date_idx <- kefj_site == "Aialik" &
  kefj_datetime >= Aialik_start &
  kefj_datetime <= Aialik_end
Aialik_datetime <- kefj_datetime[date_idx]
Aialik_temperature <- kefj_temperature[date_idx]
Aialik_exposure <- kefj_exposure[date_idx]
plot_kefj(Aialik_datetime, Aialik_temperature, Aialik_exposure)

# P4: Make a copy of your code from P3 and edit it to plot the temperature and
# exposure for "Harris" on 2016-04-05.
Harris_start <- as.POSIXct("2016-04-05 0:00:00", tz = "Etc/GMT+8")
Harris_end <- as.POSIXct("2016-04-05 23:59:59", tz = "Etc/GMT+8")
date_idx <- kefj_site == "Harris" &
  kefj_datetime >= Harris_start &
  kefj_datetime <= Harris_end
Harris_datetime <- kefj_datetime[date_idx]
Harris_temperature <- kefj_temperature[date_idx]
Harris_exposure <- kefj_exposure[date_idx]
plot_kefj(Harris_datetime, Harris_temperature, Harris_exposure)

# P5: Compare your solutions for P3 and P4 - what variables changed? We had to
# change the name of the site in which we wanted our data from along with the
# day in which we wanted that data

# P6: What you would pick for the temperature extraction function and
# parameters' names?

# Writing extraction functions --------------------------------------------

# P7: Fill in the blanks in the code below to write your temperature extraction
# function.

extract_temp <- function(site, date_start, date_end) {
  date_start <- get_datetime(date_start)
  date_end <- get_datetime(date_end)
  temp_idx <- kefj_site == site &
    kefj_datetime >= date_start &
    kefj_datetime <= date_end
  site_temp <- kefj_temperature[temp_idx]
    return(site_temp)
}

# P8: Make a copy of your solution to P7, and edit it to create exposure and
# datetime extraction functions.
extract_exposure <- function(site, date_start, date_end) {
  date_start <- get_datetime(date_start)
  date_end <- get_datetime(date_end)
  exp_idx <- kefj_site == site &
    kefj_datetime >= date_start &
    kefj_datetime <= date_end
  site_exp <- kefj_exposure[exp_idx]
  return(site_exp)
}

extract_date <- function(site, date_start, date_end) {
  date_start <- get_datetime(date_start)
  date_end <- get_datetime(date_end)
  date_idx <- kefj_site == site &
    kefj_datetime >= date_start &
    kefj_datetime <= date_end
  site_date <- kefj_datetime[date_idx]
  return(site_date)
}
# P9: Export your annotated screenshot as a JPEG called "annotated_function.jpg"
# and add it to your copy of the module repository. (It should be in the same
# folder as this file.)

# P10: Visualize Nuka Pass on July 1, 2018.
Nuka_Pass_date <- extract_date("Nuka_Pass", "2018-07-01", "2018-07-02")
Nuka_Pass_temp <- extract_temp("Nuka_Pass", "2018-07-01", "2018-07-02")
Nuka_Pass_exp <- extract_exposure("Nuka_Pass", "2018-07-01", "2018-07-02")
plot_kefj(Nuka_Pass_date, Nuka_Pass_temp, Nuka_Pass_exp)

# P11: Save a copy of the Nuka Pass plot as "nuka_pass_2018-07-01.png" in this
# repo

# P12: Compare the code you wrote to create the plot in this module to the code
# you wrote in PROG101. Qualitatively, how do they compare? Which one is easier
# to read and why?
# By creating functions and encapsulating the code it made writing and reading
# the plotted code much more simple. There is less code to get confused by and
# more clarity as to what is happening. It also allowed for us to chunk out the
# work and understand each part individually before plotting the information.
