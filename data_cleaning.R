# 
# # Data Wrangling & Data Cleaning
# 
# ## Part A — Create and Inspect Data
# 
# ### Question 1: Create a Student Dataset
# 
# Create the following data frame:
#   
#   ```
 students <- data.frame(
   id = 1:10,
   name = c("Ali", "Sara", "Ahmed", "Ayesha", "Bilal",
           "Hina", "Usman", "Fatima", "Hamza", "Zara"),
   age = c(20, 21, 19, 22, 20, 21, 23, 19, 20, 22),
  gender = c("Male", "Female", "Male", "Female", "Male",
              "Female", "Male", "Female", "Male", "Female"),
   marks = c(85, 92, 76, 88, 65, 95, 72, 89, 55, 91),
   department = c("DS", "CS", "DS", "AI", "CS",
                 "DS", "AI", "CS", "DS", "AI")
 )
# ```
# 
# Perform the following:
#   
#   1. Display the dataset.
 View(students)
 print(students)
# 2. Display the first 5 rows.
 head(students)
# 3. Display the last 3 rows.
 tail(students,n=3)
# 4. Check the structure of the dataset.
 dim(students)
# 5. Find the number of rows and columns.
 nrow(students)
 ncol(students)
# 6. Display the column names.
 colnames(students)
# 7. Generate a summary of the dataset.
 summary(students)
# 
# ---
#   
#   # Part B — Selecting Columns
#   
#   ### Question 2: Select Specific Columns
#   
#   Using the `students` dataset:
#  
 install.packages('dplyr')
 library(dplyr)
#   1. Select only `name` and `marks`.
 students %>% select(name,marks)
# 2. Select `name`, `department`, and `marks`.
 students %>% select(name,department,marks)
# 3. Select all columns except `gender`.
 students %>% select(id,name,marks,age,department)
# 4. Select the first three columns.
 students[,c(1,2,3)]
# 
# Try using **dplyr** functions.
# 
# ---
#   
#   ### Question 3: Rename Columns
#   
#   Rename:
#   
#   ```
# id → student_id
# marks → score
# department → program
# ```
 library(dplyr)
 students<-students %>% rename(
   student_id=id,score=marks,program=department
 )
 View(students)
head(students)
# Your resulting dataset should have the new column names.
# 
# ---
#   
#   # Part C — Filtering Rows
#   
#   ### Question 4: Basic Filtering
#   
#   Using `students`:
#   
#   1. Find students whose marks are greater than 80.
high_scores<-students%>% filter(score>80)
high_scores
# 2. Find students whose marks are less than 70.
lower_scores<-students%>% filter(score<70)
lower_scores
# 3. Find students whose age is greater than 20.
youngers<-students%>% filter(age>20)
youngers
# 4. Find all students from the `DS` department.
DS_students<-students%>% filter(program=='DS')
DS_students
# 5. Find all female students.
female_Students<-students %>% filter(gender=='Female')
female_Students
# 6. Find students whose marks are exactly 95.
topper<-students %>%filter(score==95)
topper
# ---
#   
#   ### Question 5: Multiple Conditions
#   
#   Find students who satisfy the following conditions:
#   
#   1. Marks > 80 **AND** department is `"DS"`.
ds_students<-students%>%filter(score>80,program=='DS')
ds_students

# 2. Marks > 80 **OR** age > 21.
aged_people<-students%>%filter(score>80 | age>21)
aged_people
# 3. Female students with marks > 85.
female_students<-students%>%filter(gender=='Female',score>85)
female_students
# 4. Students from `CS` or `AI`.
cs_ai_Students<-students%>%filter(program=='CS' | program=='AI')
cs_ai_Students
# 5. Students whose marks are between 70 and 90.
marked_students<-students%>%filter(score>=70 & score<=90)
marked_students
#   
#   # Part D — Creating New Variables
#   
#   ### Question 6: Create a Grade Column
#   
#   Create a new column called `grade`.
# 
# Use these rules:
#   
#   ```
# Marks >= 90 → A
# Marks >= 80 → B
# Marks >= 70 → C
# Marks >= 60 → D
# Marks < 60  → F
# ```
# 
students<-students%>%
  mutate(
    grade=case_when(
      score>=90 ~"A",
      score >= 80 ~ "B",
      score >= 70 ~ "C",
      score >= 60 ~ "D",
      score < 60  ~ "F"
      
      
    )
  )
students
#   ### Question 7: Pass/Fail Column
#   
#   Create a new column called `status`.
# 
# Rules:
#   
#   ```
# marks >= 50 → "Pass"
# marks < 50  → "Fail"
# ```
students<-students%>%
  mutate(
    status=case_when(
      score>=50~ "Pass",
      score<50 ~ 'Fail'
    )
  )
students
# ---
#   
#   ### Question 8: Bonus Marks
#   
#   Create a new column called `bonus_marks`.
# 
# Give:
#   
#   - 5 bonus marks to students with marks ≥ 85
# - 2 bonus marks to students with marks between 70 and 84
# - 0 bonus marks to everyone else
#   
students <- students %>%
  mutate(
    bonus_marks = case_when(
      score >= 85 ~ 5,
      score >= 70 ~ 2,
      TRUE ~ 0
    )
  )
students
#   
#   # Part E — Sorting
#   
#   ### Question 9: Arrange Data
#   
#   Sort the students:
#   
#   1. By marks from lowest to highest.
# 2. By marks from highest to lowest.
# 3. By age from highest to lowest.
# 4. By department alphabetically.
# 5. First by department and then by marks descending.
# 
students_low_high<-students%>%
  arrange(score)
students_low_high   

students_high_low<-students%>%
  arrange(desc(score))
students_high_low
students_age <- students %>%
  arrange(desc(age))

students_age
students_department <- students %>%
  arrange(program)

students_department


students_dept_marks <- students %>%
  arrange(program, desc(score))

students_dept_marks


#   # Part F — Missing Values
  
 employees <- data.frame(
   id = 1:10,
  name = c("Ali", "Sara", "Ahmed", "Ayesha", "Bilal",
           "Hina", "Usman", "Fatima", "Hamza", "Zara"),
   age = c(25, 30, NA, 28, 35, NA, 29, 31, 27, 26),
  salary = c(50000, 60000, NA, 55000, 70000,
             65000, NA, 58000, 52000, NA),
   department = c("IT", "HR", "IT", NA, "Finance",
                  "HR", "IT", "Finance", NA, "HR")
 )
# ```
# 
# ### Question 10: Identify Missing Values
# 
# 1. Find the number of missing values in each column.
# 2. Find the total number of missing values.
# 3. Find rows containing missing values.
# 4. Find students/employees with missing salary.
# 5. Find employees with missing department.
# 
colSums(is.na(employees))
sum(is.na(employees))
employees[!complete.cases(employees), ]
employees[is.na(employees$salary),]
employees[is.na(employees$department),]
#   
#   ### Question 11: Handle Missing Values
#   
#   Using `employees`:
#   
#   1. Remove rows containing any missing value.
# 2. Replace missing `age` with the mean age.
# 3. Replace missing `salary` with the median salary.
# 4. Replace missing department with `"Unknown"`.
# 
c_employees<-na.omit(employees)
c_employees
employees$age[is.na(employees$age)]<-
  mean(
    employees$age,
    na.rm=TRUE
  )
employees
employees$salary[is.na(employees$salary)]<-
  median(
    employees$salary,
    na.rm = TRUE
  )
employees
employees$department[is.na(employees$department)]<-'unknown'
employees
#   # Part G — Duplicate Data
#   
#   ### Question 12: Find Duplicates
#   
#   Create this dataset:
#   
#   ```
 data <- data.frame(
   id = c(1, 2, 3, 3, 4, 5, 5),
   name = c("Ali", "Sara", "Ahmed", "Ahmed",
            "Bilal", "Hina", "Hina"),
   marks = c(80, 90, 75, 75, 88, 92, 92)
 )
# 
#   
#   1. Identify duplicate rows.
# 2. Count duplicate rows.
# 3. Remove duplicate rows.
# 4. Create a dataset containing only unique records.
# 
# ---
 data[duplicated(data),]
 sum(duplicated(data))
 unique_data<-data[!duplicated(data),]
 unique_data
#   # Part H — Data Type Cleaning
#   
#   ### Question 13: Convert Data Types
#   
#   Create:
#   
#   ```
 data <- data.frame(
   name = c("Ali", "Sara", "Ahmed"),
   age = c("20", "21", "22"),
   marks = c("85", "90", "78"),
  gender = c("Male", "Female", "Male")
)
# ```
# 
# Tasks:
#   
#   1. Check the structure using `str()`.
# 2. Convert `age` to numeric.
# 3. Convert `marks` to numeric.
# 4. Convert `gender` to a factor.
# 5. Check the structure again.
# 
str(data)
data$age<-as.numeric(data$age)
data$marks<-as.numeric(data$marks)
data$gender<-as.factor(data$gender)
str(data)
#   
#   # Part I — String Cleaning
#   
#   ### Question 14: Clean Names
#   
#   Create:
#   
#   ```
 students <- data.frame(
   name = c(" ali ", "SARA", " ahmed", "AYESHA ",
           " bilal ", "HINA")
 )
# ```
# 
# Clean the `name` column so that the final result looks like:
#   
#   ```
# Ali
# Sara
# Ahmed
# Ayesha
# Bilal
# Hina
# ```
# 
# **Hint:** Investigate:
#   
#   ```
# trimws()
# tolower()
# toupper()
# ```
students$name<-tolower(students$name)
students$name<-trimws(students$name)
students$name<-tools::toTitleCase(students$name)
students# You can also investigate `stringr`.
# 
# ---
#   
#   ### Question 15: Clean Department Names
#   
#   Given:
#   
#   ```
data <- data.frame(
   department = c(
     "Data Science",
     "data science",
     "DATA SCIENCE",
     "Data  Science",
     "Computer Science",
     "computer science"
   )
 )
# ```
# 
# Clean the department names so that variations of the same department have a consistent format.
# 
data$department<-trimws(data$department)
data$department<-tolower(data$department)
data$department<-tools::toTitleCase(data$department)
data
#   
#   # Part J — Grouping and Summarizing
#   
#   ### Question 16: Department Statistics
#   
#   Using the `students` dataset:
#   
#   Calculate for each department:
#   
#   1. Number of students.
# 2. Average marks.
# 3. Maximum marks.
# 4. Minimum marks.
# 
# **Hint:**
#   
#   ```
# group_by()
# summarise()
# ```
library(dplyr) 

students%>%group_by(department)%>%
  summarise(
    number_of_students=n(),
    average_marks=mean(marks,na.rim=TRUE),
    maximum_marks=max(marks,na.rim=TRUE),
    minimum_marks=min(marks,na.rim=TRUE)
  )
# ---
#   
#   ### Question 17: Gender Statistics
#   
#   Find:
#   
#   1. Number of male and female students.
# 2. Average marks by gender.
# 3. Maximum marks by gender.
# 4. Minimum marks by gender.
# 

students %>%
  group_by(gender) %>%
  summarise(
    number_of_students = n()
  )

students%>%group_by(gender)%>%
  summarise(
    number_of_students=n(),
    average_marks=mean(marks,na.rim=TRUE),
    maximum_marks=max(marks,na.rim=TRUE),
    minimum_marks=min(marks,na.rim=TRUE)
  )
#   
#   ### Question 18: Department \+ Gender
#   
#   Calculate the **average marks** for each combination of:
#   
#   ```
# department + gender
# ```
# 
# For example:
#   
#   ```
# DS + Male
# DS + Female
# CS + Male
# CS + Female
# ```
# 
students%>%group_by(department,gender)%>%
  summarise(
    average_marks=mean(marks,na.rm=TRUE),
    .groups="drop"
  )
#   


#   # Part K — `mutate()` Practice
#   
#   ### Question 19: Percentage
#   
#   Suppose the total marks are 100.
# 
# Create:
#   
#   ```
# percentage = marks
# ```
# 
# Then create a new column called `performance`:
#   
#   ```
# percentage >= 90 → Excellent
# percentage >= 80 → Very Good
# percentage >= 70 → Good
# percentage >= 60 → Average
# percentage < 60  → Poor
students<-
  students%>%
  mutate(
    percentage=marks,
    performance=case_when(
      percentage>=90 ~'Excellent',
      percentage>=80 ~'Very good',
      percentage>=70 ~'Good',
      percentage>=60 ~'Average',
      percentage<60 ~'Poor'
    )
  )
students
#   
#   ### Question 20: Age Category
#   
#   Create an `age_group` column:
#   
#   ```
# age < 20       → Teen
# 20–21          → Young
# 22–23          → Adult
# ```
students<-
  students%>%
  mutate(
    age_group=age,
    age_group=case_when(
      age<20 ~'Teen',
      age==20 | age==21 ~'Young',
      age==22 |age==23 ~'Adult'
    )
  )
students
# ---
#   
#   # Part L — Combining Data
#   
#   ### Question 21: Join Two Datasets
#   
#   Create:
#   
#   ```
 students <- data.frame(
   id = c(1, 2, 3, 4),
   name = c("Ali", "Sara", "Ahmed", "Ayesha"),
  department = c("DS", "CS", "AI", "DS")
 )
# 
fees <- data.frame(
  id = c(1, 2, 3, 4),
  fee = c(50000, 55000, 60000, 50000)
 )

# 
# Perform:
#   
#   1. Inner join.
# 2. Left join.
# 3. Right join.
# 4. Full join.
# 
inner_join(students,fees,by='id')

left_join(students,fees,by='id')
right_join(students,fees,by='id')
full_join(students,fees,by='id')
# ```
# 
# ---
#   
#   # Part M — Advanced Cleaning Challenge
#   
#   ### Question 22: Clean a Messy Student Dataset
#   
#   Create this intentionally messy dataset:
#   
#   ```
 messy_students <- data.frame(
   id = c(1, 2, 3, 3, 4, 5),
  name = c(
     " ali ",
    "SARA",
     "Ahmed",
     "Ahmed",
     " ayesha ",
     "BILAL"
   ),
   age = c(20, 21, NA, NA, 22, 20),
   marks = c("85", "92", "76", "76", "88", "N/A"),
   gender = c(
     "Male",
     "female",
     "M",
     "M",
     "Female",
     "male"
   ),
   department = c(
     "DS",
     "CS",
     "Data Science",
     "Data Science",
     "DS",
     "CS"
   )
 )
# ```
# 
# ### Clean this dataset completely.
# 
# Your tasks:
#   
#   1. Identify missing values.
# 2. Identify duplicate records.
# 3. Remove duplicate records.
# 4. Clean the names.
# 5. Standardize gender values:
#   - `M` → `Male`
# - `male` → `Male`
# - `female` → `Female`
# - `Female` → `Female`
# 6. Convert `marks` to numeric.
# 7. Convert `"N/A"` to `NA`.
# 8. Handle missing marks.
# 9. Standardize department names.
# 10. Create a `grade` column.
# 11. Sort students by marks.
# 12. Produce a final clean dataset.
# 
colSums(is.na(messy_students))
messy_students[duplicated(messy_students),]
messy_students<-messy_students[!duplicated(messy_students),]
messy_students$marks[messy_students$marks == "N/A"] <- NA


messy_students$name <- trimws(messy_students$name)
messy_students$name <- tolower(messy_students$name)
messy_students$name <- tools::toTitleCase(messy_students$name)

messy_students$gender<-tolower(messy_students$gender)
messy_students$gender[messy_students$gender=='m']<-'male'
messy_students$gender<-tools::toTitleCase(messy_students$gender)
messy_students

messy_students
messy_students$department <- ifelse(
  messy_students$department == "DS",
  "Data Science",
  messy_students$department
)

messy_students$department <- ifelse(
  messy_students$department == "CS",
  "Computer Science",
  messy_students$department
)
messy_students$grade <- case_when(
  messy_students$marks >= 90 ~ "A+",
  messy_students$marks >= 80 ~ "A",
  messy_students$marks >= 70 ~ "B",
  messy_students$marks >= 60 ~ "C",
  TRUE ~ "F"
)
messy_students <- messy_students[
  order(messy_students$marks),
]
#   # Part N — Final Mini Project
#   
#   ## Question 23: Student Performance Analysis
#   
#   Create a dataset containing at least **20 students** with these variables:
#   
#   ```
# student_id
# name
# age
# gender
# department
# attendance
# assignment_marks
# midterm
# final_exam
students <- data.frame(
  student_id = 1:20,
  
  name = c(
    "Ali", "Sara", "Ahmed", "Ayesha", "Bilal",
    "Hina", "Usman", "Fatima", "Hamza", "Zainab",
    "Omar", "Mariam", "Hassan", "Noor", "Danish",
    "Iqra", "Saad", "Laiba", "Taha", "Anaya"
  ),
  
  age = c(
    20, 21, 22, 20, 23,
    21, 22, 20, 24, 21,
    23, 22, 20, 21, 24,
    22, 23, 20, 21, 22
  ),
  
  gender = c(
    "Male", "Female", "Male", "Female", "Male",
    "Female", "Male", "Female", "Male", "Female",
    "Male", "Female", "Male", "Female", "Male",
    "Female", "Male", "Female", "Male", "Female"
  ),
  
  department = c(
    "DS", "CS", "AI", "DS", "CS",
    "AI", "DS", "CS", "AI", "DS",
    "CS", "AI", "DS", "CS", "AI",
    "DS", "CS", "AI", "DS", "CS"
  ),
  
  attendance = c(
    90, 85, 72, 95, 88,
    78, 91, 69, 83, 97,
    74, 89, 92, 76, 81,
    94, 68, 87, 96, 79
  ),
  
  assignment_marks = c(
    18, 17, 15, 19, 16,
    14, 19, 13, 17, 20,
    15, 18, 19, 16, 17,
    20, 12, 18, 19, 15
  ),
  
  midterm = c(
    22, 20, 18, 24, 21,
    17, 23, 16, 20, 25,
    19, 22, 24, 18, 21,
    25, 15, 23, 24, 19
  ),
  
  final_exam = c(
    45, 42, 38, 48, 44,
    35, 46, 34, 41, 47,
    39, 44, 49, 36, 42,
    48, 30, 45, 47, 40
  )
)
# 
# Then perform the following data-wrangling tasks:
#   
#   ### Step 1 — Inspect
#   
#   ```
# head()
# tail()
# str()
# summary()
head(students)

tail(students)

str(students)

summary(students)
# ### Step 2 — Clean
# 
# - Find missing values.
# - Find duplicates.
# - Correct incorrect data types.
# - Standardize text.
# - Remove or replace missing values.


colSums(is.na(students)) 
students[duplicated(students), ]
students <- students[!duplicated(students), ]
str(students)
# ### Step 3 — Create Variables
# 
# Create:
#   
#   ```
# total_marks
# percentage
# grade
# result

students <- students %>%
  mutate(
    total_marks = assignment_marks + midterm + final_exam,
    
    percentage = total_marks,
    
    grade = case_when(
      percentage >= 90 ~ "A+",
      percentage >= 80 ~ "A",
      percentage >= 70 ~ "B",
      percentage >= 60 ~ "C",
      TRUE ~ "F"
    ),
    
    result = ifelse(
      percentage >= 50,
      "Pass",
      "Fail"
    )
  )
# 
# ### Step 4 — Filter
# 
# Find:
#   
#   - Students who scored \> 80%.
# - Students with attendance \< 75%.
# - Students who failed.
# - Students from the Data Science department.



students %>%
  filter(percentage > 80)

students %>%
  filter(attendance < 75)

students %>%
  filter(result == "Fail")

students %>%
  filter(department == "DS")

# ### Step 5 — Group
# 
# Calculate:
#   
#   - Average percentage by department.
# - Average percentage by gender.
# - Number of students in each department.
# - Number of pass/fail students.


students %>%
  group_by(department) %>%
  summarise(
    average_percentage = mean(percentage)
  )
students %>%
  group_by(gender) %>%
  summarise(
    average_percentage = mean(percentage)
  )
students %>%
  group_by(department) %>%
  summarise(
    number_of_students = n()
  )

students %>%
  group_by(result) %>%
  summarise(
    number_of_students = n()
  )
# ### Step 6 — Sort
# 
# Find:
#   
#   - Top 5 students.
# - Bottom 5 students.
# - Department with the highest average score.
# 
students %>%
  arrange(desc(percentage)) %>%
  slice_head(n = 5)

students %>%
  arrange(percentage) %>%
  slice_head(n = 5)
students %>%
  group_by(department) %>%
  summarise(
    average_percentage = mean(percentage)
  ) %>%
  arrange(desc(average_percentage)) %>%
  slice_head(n = 1)
