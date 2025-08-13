use assessmentdb;

select * from subjects;
select * from QUESTIONBANK;
select * from interviews;
select * from evaluationcriterias;
select * from interviewresults;
select * from employees;
select * from candidateanswers;
select * from candidatetestresults;
desc candidatetestresults;
SELECT * FROM employees WHERE userId=1;
select*from employees;
select questionbank.id,questionbank.title,questionbank.a,questionbank.b,questionbank.c,questionbank.d from questionbank inner join subjects on subjects.id=questionbank.subjectid
where subjects.title="ADVJAVA";

select * from tests ;