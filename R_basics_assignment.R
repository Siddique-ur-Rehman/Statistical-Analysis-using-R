##############################################################################
#  PRACTICE QUESTIONS — INTRODUCTION TO R
#  Companion to Lecture_01.R
#  Organized by the SAME categories covered in the lecture.
#  Write your R code answer directly under each question, then run it.
#
#  ACADEMIC INTEGRITY NOTICE:
#  This is an INDIVIDUAL assignment. Every student must write and submit
#  their own original work. Do NOT copy, share, or use another person's
#  code/answers, and do NOT let anyone copy yours. Discussing general
#  concepts is fine, but the code you submit must be entirely your own.
#  Identical or near-identical submissions from different students will
#  be treated as an academic integrity violation.
##############################################################################


# ============================================================================
# CATEGORY 0: GETTING STARTED
# ============================================================================

# Q0.1: Write the command that shows your current working directory.
getwd()

# Q0.2: How do you write a comment in R that R will ignore when running code?
#This is comment using hash sign

# Q0.3: Write the command to change your working directory to "D:/RClass"
#       (leave it commented out, the way the lecture file does).

#setwd("D:/RClass")

# ============================================================================
# CATEGORY 1: BASIC ARITHMETIC OPERATIONS
# ============================================================================

# Q1.1: Compute 45 divided by 6, and separately find the remainder of 45/6
#       and the result of integer (floor) division 45 %/% 6.
45/6
45%%6
45%/%6
# Q1.2: Without running R, predict the result of: 3 + 4 * 2 ^ 2
#       Then check your answer by running it.
3+4*2^2

# Q1.3: Write an expression that checks whether 12 is NOT equal to 15.
if(12!=15){
  print('12 not equal to 15')
  
}else{
  print('Both are equal')
}

# Q1.4: Using logical operators, write an expression that is TRUE only when
#       BOTH "5 > 2" and "3 < 1" are true. Then write one that is TRUE when
#       AT LEAST ONE of them is true.

(5>2)&(3<1)# and condition
(5>2)|(3<1)

# ============================================================================
# CATEGORY 2: VARIABLES AND ASSIGNMENT
# ============================================================================

# Q2.1: Create a variable "age" and assign it the value 21 using each of the
#       three assignment styles shown in the lecture (<-, =, ->).
age<-21
age=21
21->age
# Q2.2: Create two variables, "length" and "width", holding 8 and 3.
#       Multiply them and store the result in a new variable called "area".
#       Print "area".
length<-8
width<-3
area<-length*width

# Q2.3: Explain (in a comment) why "my_var" and "MyVar" can exist as two
#       completely different variables in R.

#Because R language is case sensitive when we change any letter capital or lower case so 
#it become different variable and has differ memory 


# Q2.4: Create a variable called "count" with value 10, then reassign it to
#       50, printing the value both times.

count<-10
count<-50
# ============================================================================
# CATEGORY 3: DATA TYPES
# ============================================================================

# Q3.1: Use class() to check the data type of: 7, 7L, "seven", TRUE, 2+1i.
name<-'Ahmad'
new_age<-34L
marks<-76.7
z<-2+1i
is_present<-TRUE
class(name)
class(new_age)
class(marks)
class(z)
class(is_present)

# Q3.2: Convert the character "42" into a numeric value, then convert the
#       numeric value 42 into a character. Confirm each type with class().
character<-42
class(character)
other_Value=as.character(character)
class(other_Value)

# Q3.3: What is the difference between NA, NULL, and NaN? Give one example
#       of R code that produces each.
#NA shows not avaalible
ages_list<-c(34,54,23,51,NA,67,87)
ages_list
#nan shows not a number means invalid maths operation
sqrt(-1)
0/0
#null shows absence completely

details<-list(name='Ahmad',age=23)
details$name
details$height#shows null because not present
# Q3.4: What does 5/0 return in R? What does 0/0 return? Are they the same?

#5/0 will produce infinity but the 0/0 is invalid maths operation it will produce nan


# ============================================================================
# CATEGORY 4: CHARACTER STRINGS
# ============================================================================

# Q4.1: Create two strings, "first" = "Data" and "second" = "Science".
#       Combine them with a space, then with no space, then with a "_".
first='Data'
second='Science'
paste(first,second)
paste0(first,second)
paste(first,second,sep ="_")


# Q4.2: Use sprintf() to print: "Student: Sarah, Score: 88"
st_name='Sarah'
st_score=88
sprintf('Student:%s,Score:%d',st_name,st_score)

# Q4.3: Take the string "Introduction to R" and: (a) convert it to all
#       uppercase, (b) count its characters, (c) extract just "Intro".
my_string="Introduction to R"
upper_case=toupper(my_string)
sent_length=nchar(my_string)

substring=substr(my_string,start=1,stop=5)
substring

# Q4.4: Given city <- "Peshawar", use grepl() to check if it contains "shaw",
#       then use gsub() to replace all "a" with "@".
my_city='Peshawar'
new_sub=grepl(my_city,'shaw')
replacement=gsub('a','@',my_city)
replacement

# Q4.5: Split the string "red,green,blue" into separate pieces, and also
#       trim the whitespace from "   R programming   ".
colors=strsplit("red,green,blue",split=',')[[1]]
colors

new_variable="   R programming   "
removed_spaces=trimws(new_variable)
removed_spaces

# Q4.6: Given colors <- c("red", "green", "blue"), find which elements equal
#       "green", then combine all three into a single comma-separated string.

colors <- c("red", "green", "blue")
green_equal=which(colors=='green')

combined=paste(colors,collapse = ',')
combined
# ============================================================================
# CATEGORY 5: FACTORS
# ============================================================================

# Q5.1: Create a factor from this vector: c("Yes", "No", "Yes", "Yes", "No")
#       and list its levels.
responses= c("Yes", "No", "Yes", "Yes", "No")
factor_wise=factor(responses)
factor_wise

# Q5.2: For the factor you just created, show its underlying integer codes,
#       then convert it back to character.

int_codes=as.integer(factor_wise)

int_codes
character_wise=as.character(responses)
character_wise
# Q5.3: Create an ORDERED factor for satisfaction levels "Low", "Medium",
#       "High" (in that order) with data: c("Medium","High","Low","High").
#       Confirm that "High" is greater than "Low" using a comparison.
satisfaction_level= c("Medium","High","Low","High")
fact_data=factor(satisfaction_level,levels =c('Low','Medium','High'),ordered = TRUE)
fact_data
print(fact_data[1]<fact_data[2])
# Q5.4: Using table() and summary(), count how many "Yes" vs "No" responses
#       are in the factor from Q5.1.
table(responses)
summary(responses)
# Q5.5: Rename the levels of the Q5.1 factor from "Yes"/"No" to "Y"/"N".

levels(factor_wise)=c('N','Y')
factor_wise

# ============================================================================
# CATEGORY 6: VECTORS
# ============================================================================

# Q6.1: Create a numeric vector of 8 temperatures (Celsius) of your choice,
#       then convert ALL of them to Fahrenheit in a single line
#       (Formula: F = C * 9/5 + 32). Find the warmest and coldest values.
temp=7
F=temp*9/5 +32
F

# Q6.2: Generate a sequence from 1 to 50 in steps of 5, and separately
#       generate 6 evenly spaced numbers between 0 and 1.

my_sequence=seq(from=1,to=50,by=5)
my_sequence
seq_by_length <- seq(from = 0, to = 1, length.out = 6)
print(seq_by_length)
# Q6.3: Create a vector using rep() that repeats c(3, 6) four times, and
#       another that repeats each element of c(3, 6) four times in a row.
my_vector=rep(c(3,5),times=4)
my_vector
repeat_element=rep(c(3,6),each=4)
repeat_element
# Q6.4: Given v <- c(12, 45, 7, 23, 89, 34), extract: the 3rd element, the
#       1st and 4th elements together, everything except the last element,
#       and only the elements greater than 20.
v <- c(12, 45, 7, 23, 89, 34)
v[3]
v[1:5]
v[c(1,4)]
# Q6.5: Given a <- c(2, 4, 6) and b <- c(1, 2, 3), compute their element-wise
#       sum, difference, product, and quotient. Then explain what happens
#       (recycling) when you add c(1, 2, 3, 4, 5, 6) + c(1, 2, 3).
c(2,4,6)+c(1,2,3)
c(2,4,6)-c(1,2,3)
c(2,4,6)*c(1,2,3)
c(2,4,6)/c(1,2,3)

# Q6.6: For nums <- c(11, 4, 19, 2, 27, 8): find the sum, mean, median,
#       standard deviation, sorted (ascending & descending) order, and the
#       INDEX (position) of the maximum value.
nums=c(11,4,19,2,27,8)
sum(nums)
mean(nums)
median(nums)
sd(nums)
sort(nums)
sort(nums,decreasing = TRUE)

# Q6.7: Create a named vector "temps" with names "Mon","Tue","Wed" and
#       values 30, 32, 29. Retrieve the value for "Tue" by name.
temps=c(Mon=30,Tue=32,Wed=29)
temps['Tue']


# ============================================================================
# CATEGORY 7: MATRICES
# ============================================================================

# Q7.1: Create a 4x4 matrix containing the numbers 1 to 16, filled BY ROW.
#       Then extract: the 2nd row, the 3rd column, and the 2x2 submatrix in
#       the top-left corner.
my_matrix=matrix(1:16,nrow = 4,ncol=4,byrow=TRUE)
my_matrix[2,]
my_matrix[,3]
my_matrix[1:2,3:4]

# Q7.2: Create two 2x2 matrices of your choice and demonstrate the
#       difference between element-wise multiplication (*) and true matrix
#       multiplication (%*%).
new_matrix1=matrix(10:13,nrow=2,ncol=2)
new_matrix2=matrix(3:6,nrow=2,ncol=2)
multipy_both=new_matrix1*new_matrix2
multipy_both

multipy_both_true=new_matrix1%*%new_matrix2
multipy_both_true

# Q7.3: For a square matrix M <- matrix(c(2,1,1,3), nrow=2), find its
#       transpose, determinant, and inverse.
M = matrix(c(2,1,1,3),nrow=2)
m_transpose=t(M)
m_transpose
m_determinent=det(M)
m_inverse=solve(M)
m_inverse

# Q7.4: Create a matrix from two row vectors using rbind(), then create one
#       from two column vectors using cbind().
v1=c(3,2,1)

v2=c(2,3,2)

row_combine=rbind(v1,v2)
row_combine
col_combine=cbind(v1,v2)
col_combine
# Q7.5: For matrix A <- matrix(1:9, nrow = 3), compute the row sums, column
#       sums, row means, column means, and extract its diagonal elements.

a_vector= matrix(1:9, nrow = 3)
a_vector
row_sum=rowSums(a_vector)
row_sum
col_sum=colSums(a_vector)
col_sum
av_diagnol=diag(a_vector)
av_diagnol

# Q7.6: Create a 3x3 matrix and assign row names "R1","R2","R3" and column
#       names "C1","C2","C3".

matrix_last=matrix(11:19,nrow=3,ncol=3)
rownames(matrix_last)<-c('R1','R2','R3')
colnames(matrix_last)<-c('C1','C2','C3')
matrix_last
# ============================================================================
# CATEGORY 8: LISTS AND DATA FRAMES
# ============================================================================

# Q8.1: Create a list holding a person's "name" (character), "age"
#       (numeric), and "hobbies" (a character vector of 3 items). Access
#       just the name, and just the second hobby.

details_list=list(name='Ahmad',age=56,hobbies=c('Playing','watching','reading'))
details_list['name']
details_list[['hobbies']][2]

# Q8.2: Build a data frame of 5 employees with columns "Name",
#       "Department" (stored as a factor), and "Salary". Use table() to
#       count employees per department, and compute the average salary.
employye_df=data.frame(
  Emp_Names=c('Wali','Khan','Yaseen','New1'),
  Dept=c('CS','CS','AI','AI'),
  salary=c(23000,34000,56000,45000)
)
table(employye_df$Dept)
aggregate(salary~Dept,data=employye_df,FUN=mean)
# Q8.3: For the data frame in Q8.2, extract: the "Name" column using $,
#       the first row using [ , ], and the "Salary" column using its name
#       in [ , "Salary"] form.

new_df=data.frame(
  Name=c('Khan','Akbar','Ali'),
  age=c(23,45,33),
  salary=c(23000,45000,12000)
  
)
new_df$Name
new_df[1,]
new_df['salary']
# Q8.4: Run summary() and str() on your data frame from Q8.2 and explain
#       in a comment what each of the two functions tells you that the
#       other does not.
summary(new_df)#give complete summary like statistical details of any columns like min,max,average etc
str(new_df)#it only gives textual details not any mathematical values

# Q8.5: Write a small script that takes a vector of quiz scores containing
#       some NA values, replaces the NA values with the mean of the
#       non-missing scores, and prints the cleaned vector.
#       (Hint: is.na(), mean(..., na.rm = TRUE))
quiz_marks=c(23,43,NA,56,NA,76)
quiz_marks_mean=mean(quiz_marks,na.rm = TRUE)
missing_areas=is.na(quiz_marks)
missing_areas
quiz_marks[missing_areas]=quiz_marks_mean
quiz_marks
