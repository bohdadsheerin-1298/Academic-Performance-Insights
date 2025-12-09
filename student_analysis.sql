-- ===============================================
-- Student Data Analysis Project - SQL Queries
-- ===============================================

-- 1️⃣ Create Table Structure
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

---------------------------------------------------
-- 2️⃣ Class Average (Overall)
---------------------------------------------------
-- Average performance of all students in a class
SELECT 
    Class,
    AVG(Marks) AS class_average
FROM student_marks
GROUP BY Class;

---------------------------------------------------
-- 3️⃣ Subject-wise Average Marks
---------------------------------------------------
SELECT 
    Subject, 
    AVG(Marks) AS subject_wise_average
FROM student_marks 
GROUP BY Subject;

---------------------------------------------------
-- 4️⃣ Top Scorer (Highest Marks in Dataset)
---------------------------------------------------
SELECT 
    Name,
    Marks
FROM student_marks
ORDER BY Marks DESC
LIMIT 1;

---------------------------------------------------
-- 5️⃣ Pass vs Fail Count
---------------------------------------------------
SELECT 
    SUM(CASE WHEN Marks >= 35 THEN 1 ELSE 0 END) AS Passed,
    SUM(CASE WHEN Marks < 35 THEN 1 ELSE 0 END) AS Failed
FROM student_marks;

---------------------------------------------------
-- 6️⃣ Highest Scorer in Each Subject (Subject Toppers)
---------------------------------------------------
SELECT 
    s.*
FROM student_marks s
JOIN (
    SELECT 
        Subject, 
        MAX(Marks) AS max_marks
    FROM student_marks 
    GROUP BY Subject
) t
ON s.Subject = t.Subject 
AND s.Marks = t.max_marks;

