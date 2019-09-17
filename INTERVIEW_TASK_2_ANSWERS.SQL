-- Вопрос# 1: Выберите TOP 3rd EMPLOYEE
SELECT
    *
FROM
    EMP
LIMIT 3;


-- Вопрос# 2: Получить 2nd maximum salary
SELECT
    *
FROM (
    SELECT
        SALARY
    FROM
        EMP
    ORDER BY
        SALARY DESC
    LIMIT 2) TS
ORDER BY
    TS.SALARY ASC
LIMIT 1;


-- Вопрос# 3: Вывести "EMPLOYEE NAME", DOB, "DEPARTMENT NAME"
-- of "QA" DEPARTMENT, Sorting by "EMPLOYEE NAME" ASC
SELECT
    E.EMPNAME,
    DOB,
    D.DEPTNAME
FROM
    EMP E
    LEFT JOIN DEPT D ON E.DEPTID = D.DEPTID
WHERE
    D.DEPTNAME = "QA"
ORDER BY
    E.EMPNAME ASC;


-- Вопрос# 4: Вывести "EMPLOYEE NAME", "AGE", "DEPARTMENT NAME" Sort by "AGE" DESC
SELECT
    E.EMPNAME,
    TIMESTAMPDIFF(YEAR, E.DOB, CURDATE()) AS AGE,
    D.DEPTNAME
FROM
    EMP E
    LEFT JOIN DEPT D ON E.DEPTID = D.DEPTID
WHERE
    D.DEPTNAME = "QA"
ORDER BY
    AGE DESC;


-- Вопрос# 5: Вывести "DEPARTMENT NAME", Number of Employees Sort by Number of Employees
SELECT
    D.DEPTNAME,
    count(E.EMPID)
FROM
    EMP E
    LEFT JOIN DEPT D ON E.DEPTID = D.DEPTID
ORDER BY
    count(E.EMPID);


-- Вопрос# 6: Вывести EMPLOYEE NAME, MANAGER NAME, DEPARTMENT NAME
-- (Показать всех работников включая тех, у кого нет менеджера)
SELECT
    E.EMPNAME,
    E.MGRID,
    D.DEPTNAME
FROM
    EMP E
    LEFT JOIN DEPT D ON E.DEPTID = D.DEPTID;


-- Вопрос# 7: Вывести EMPLOYEE NAME, MANAGER NAME, DEPARTMENT NAME
-- (Из всех отделов где более одного работника)
SELECT
    E.EMPNAME,
    E.MGRID,
    D.DEPTNAME
FROM
    EMP E
    LEFT JOIN DEPT D ON E.DEPTID = D.DEPTID
GROUP BY
    D.DEPTNAME
HAVING
    count(D.DEPTID) > 1;
