# Code placed in this file fill be executed every time the
      # lesson is started. Any variables created here will show up in
      # the user's working directory and thus be accessible to them
      # throughout the lesson.


.get_course_path <- function(){
  tryCatch(swirl:::swirl_courses_dir(),
           error = function(c) {file.path(find.package("swirl"),"Courses")}
  )
}

pat_meds <- read.csv(file.path(.get_course_path(), "Clinical_Data_in_R", "Aggregating_Clinical_Data_(Getting_to_One_Row)", "fabricated_pt_nsaids.csv"))


wide_sample <- read.csv(file.path(.get_course_path(), "Clinical_Data_in_R", "Aggregating_Clinical_Data_(Getting_to_One_Row)", "fake_wide.csv"), 
                        na.strings = c(""),
                        stringsAsFactors = FALSE)

long_sample <- tidyr::gather(wide_sample, key = "Phone Type", value = "Number", -Name, na.rm = TRUE)
                           


