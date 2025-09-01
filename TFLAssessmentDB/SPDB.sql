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

DELIMITER $$
CREATE PROCEDURE spinterviewdetails(IN pinterviewId INT)
BEGIN
    SELECT 
        interviews.id,
        interviews.interviewdate,
        interviews.interviewtime,
        interviews.smeid,
        CONCAT(employees.firstname, " ", employees.lastname) AS SmeName,
        CONCAT(candidates.firstname, " ", candidates.lastname) AS CandidateName,
        subjects.title AS Subject
    FROM 
        interviews
    INNER JOIN 
        subjectmatterexperts ON interviews.smeid = subjectmatterexperts.id
    INNER JOIN 
        employees ON subjectmatterexperts.employeeid = employees.id
    LEFT JOIN 
        employees AS candidates ON interviews.candidateid = candidates.id
    LEFT JOIN 
        subjects ON subjectmatterexperts.subjectid = subjects.id
    WHERE 
        interviews.id = pinterviewId;

    SELECT 
        evaluationcriterias.id, 
        evaluationcriterias.title 
    FROM 
        interviews
    INNER JOIN 
        interviewcriterias ON interviews.id = interviewcriterias.interviewid
    INNER JOIN 
        evaluationcriterias ON interviewcriterias.evaluationcriteriaid = evaluationcriterias.id
    WHERE 
        interviews.id = pinterviewId;

END $$

DELIMITER ;

-- Call the procedure by passing a dynamic interview ID
CALL spinterviewdetails(5);

DROP PROCEDURE IF Exists spcandidatetestresultdetails;

