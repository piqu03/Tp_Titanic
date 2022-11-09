USE tp_titanicbdd; 

/*-------------------------------------------------------Manipe utilles ------------------------------------------------------*/
/*ALTER TABLE titanic
ADD Passagerid INT PRIMARY KEY AUTO_INCREMENT NOT NULL; 
*/ -- Ajouter une nouvel colone dans la table

/*ALTER TABLE titanic
MODIFY COLUMN Passagerid INT FIRST;
 */ -- modifier la place d'une colone en premier
 
 
/*----------------------------------------------------------------------- ------------------------------------------------------*/


poulmouplou

CREATE TABLE titanic3
(
	
    pclass INT NOT NULL,
    survived BOOLEAN,
    name VARCHAR(100) NOT NULL,
    sex VARCHAR(100) NOT NULL,
    age DECIMAL NOT NULL,
    sibsp INT,
    parch INT,
    ticket VARCHAR(100),
    fare DECIMAL NOT NULL,
	cabin VARCHAR(50), 
    embarked VARCHAR(15) NOT NULL,
    boat VARCHAR(40),
    body INT,
    home_dest VARCHAR(150),
    Passagerid INT AUTO_INCREMENT NOT NULL,
    PRIMARY KEY (Passagerid)
);

LOAD DATA LOCAL INFILE 'titanic.csv' INTO TABLE titanic
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(pclass, survived, name, sex, age, sibsp, parch, ticket, fare, cabin, embarked, boat, home_dest);





-----------------------------------------------------------------------

LOAD DATA LOCAL INFILE 'C:\wamp64\bin\mysql\mysql8.0.21\data\tp_titanicbdd' INTO TABLE titanic
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(Passagerid, @vpclass, @vsurvived, @vname, @vsex, @vage, @vsibsp, @vparch, @vticket, @vfare, @vcabin, @vembarked, @vboat, @vbody, @vhome_dest);
SET 
    pclass = NULLIF( @vpclass , ''), 
    survived = NULLIF( @vsurvived , ''), 
    name = NULLIF( @vname , ' '),
    sex = NULLIF( @vsex , ''), 
    age = NULLIF( @vage , ''), 
    sibsp = NULLIF( @vsibsp , ''), 
    parch = NULLIF( @vvparch , ''), 
    ticket = NULLIF( @vticket , ''), 
    fare = NULLIF( @vfare , ''), 
    cabine = NULLIF( @vcabin , ''), 
    embarked = NULLIF( @vembarked , '') ,
    boat = NULLIF( @vboat , '') ,
    body = NULLIF( @vbody , '') ,
    home_dest = NULLIF( @vhome_dest , '') 
 

;
