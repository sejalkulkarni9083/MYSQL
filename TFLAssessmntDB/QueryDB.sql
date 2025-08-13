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

select * from testquestions;

SELECT qb.*
FROM questionbank qb
INNER JOIN testquestions tq ON qb.id = tq.questionbankid
WHERE tq.testid = 7;



select * from questionbank where subjectid=(select id from subjects where title ="ADVJAVA");
 
select * from questionbank inner join testquestions on testquestions.questionbankid = questionbank.id where testquestions.testid=1;

INSERT INTO candidateanswers (candidateid, testquestionid, answerkey) VALUES (@candidateId, @testQuestionId, @answerKey);

select * from candidateanswers;

update candidatetestresults set testendtime =@testendtime where candidateid=@candidateid and testid=@testid;
update candidatetestresults set testendtime ="2015-11-05 14:35:00" where candidateid=2 and testid=1;

SELECT s.title AS subject_title, qb.id AS question_bank_id, qb.title AS question_title, ec.title AS criteria_title
FROM questionbank qb
INNER JOIN evaluationcriterias ec ON qb.evaluationcriteriaid = ec.id
INNER JOIN subjects s ON qb.subjectid = s.id;