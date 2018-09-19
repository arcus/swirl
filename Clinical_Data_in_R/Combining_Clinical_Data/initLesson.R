# Code placed in this file fill be executed every time the
      # lesson is started. Any variables created here will show up in
      # the user's working directory and thus be accessible to them
      # throughout the lesson.

.get_course_path <- function(){
  tryCatch(swirl:::swirl_courses_dir(),
           error = function(c) {file.path(find.package("swirl"),"Courses")}
  )
}

meds_by_name <- read.csv(file.path(.get_course_path(), "Clinical_Data_in_R", "Combining_Clinical_Data", "fabricated_pt_nsaids.csv")) %>%
  group_by(PAT_MRN) %>% 
  summarise(NSAID_list = paste(GENERIC_NM, collapse = ", ")) %>%
  mutate(ibuprofen = grepl("ibuprofen", NSAID_list, ignore.case = TRUE),
         naproxen = grepl("naproxen", NSAID_list, ignore.case = TRUE),
         ketorolac = grepl("ketorolac", NSAID_list, ignore.case = TRUE),
         diclofenac = grepl("diclofenac", NSAID_list, ignore.case = TRUE),
         indomethacin = grepl("indomethacin", NSAID_list, ignore.case = TRUE)) %>%
  select(-NSAID_list)
demographics <- read.csv(file.path(.get_course_path(), "Clinical_Data_in_R", "Combining_Clinical_Data", "fabricated_pt_demo.csv"),
                         stringsAsFactors = FALSE)
demographics$SEX <- factor(demographics$SEX, levels = c(0,1), labels=c("Female", "Male"))
demographics$RACE <- factor(demographics$RACE, levels=c(1:8,99), labels=c("American Indian or Alaska Native", "Asian", 
                                                                          "Black or African-American", 
                                                                          "Native Hawaiian or Other Pacific Islander",
                                                                          "White", "More Than One Race", "Other", 
                                                                          "Refused", "Unknown or not reported"))
demographics$ETHNICITY <- factor(demographics$ETHNICITY, levels = c(1,2,99), labels = c("Hispanic or Latino", "Not Hispanic or Latino", "Unknown or Not Reported"))
demographics$PAT_DOB <- as.Date(demographics$PAT_DOB, format = "%m/%d/%y")

english <- read.csv(file.path(.get_course_path(), "Clinical_Data_in_R", "Combining_Clinical_Data", "English.csv"),
                    stringsAsFactors = FALSE)
math <- read.csv(file.path(.get_course_path(), "Clinical_Data_in_R", "Combining_Clinical_Data", "Math.csv"),
                 stringsAsFactors = FALSE)
aces <- read.csv(file.path(.get_course_path(), "Clinical_Data_in_R", "Combining_Clinical_Data", "ACE.csv"),
                 stringsAsFactors = FALSE)