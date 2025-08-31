 -- Active: 1707123530557@@127.0.0.1@3306@assessmentdb

-- get candidate test results
use assessmentdb;

drop procedure if exists spcandidatetestresult;

DELIMITER $$

create procedure spcandidatetestresult(IN pcandidateId INT,In ptestId INT,OUT pscore INT )
BEGIN
DECLARE totalMarks INT;
SELECT COUNT(CASE WHEN candidateanswers.answerkey = questionbank.answerkey THEN 1 ELSE NULL END) AS score 
INTO totalMarks FROM candidateanswers 
INNER JOIN   testquestions  on testquestions.questionbankid=candidateanswers.testquestionid
INNER JOIN   questionbank on questionbank.id=testquestions.questionbankid
WHERE candidateanswers.candidateid = pcandidateId AND testquestions.testid = ptestId;
set pscore=totalMarks;
Update candidatetestresults  set score =pscore where candidateid= pcandidateId and testid= ptestId;
END $$

DELIMITER ;

call spcandidatetestresult(1,22,@pscore);
select(@pscore);

DROP PROCEDURE IF EXISTS spinterviewdetails;