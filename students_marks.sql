CREATE TABLE student_marks (
  StudentID INT,
  Name VARCHAR(255),
  Class VARCHAR(10),
  Subject VARCHAR(50),
  Marks INT,
  MaxMarks INT,
  Percentage FLOAT,
  Result VARCHAR(20)
);

#class-wise average_marks
select avg(class) as class_avg from student_marks

#subject-wise average_marks
select Subject, avg(Marks) as sub_wise_avg
from student_marks group by Subject

#Top-performer student
select Name,Marks from student_marks
order by Marks desc
limit 1

#Pass/Fail distribution
select 
sum(case when Marks >= 35 then 1 end) as Passed,
sum(case when Marks < 35 then 1 end) as failed
from student_marks

#subject-wise marks distribution
select s.* from student_marks s
join (
select Subject, max(Marks) as max_marks
from student_marks 
group by Subject
) t
on s.Subject = t.Subject and s.Marks = t.max_marks