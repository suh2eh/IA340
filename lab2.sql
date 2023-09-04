-- Create schemas

-- Create tables
CREATE TABLE IF NOT EXISTS Professor
(
    p_EMail VARCHAR(50) NOT NULL,
    p_Name VARCHAR(100) NOT NULL,
    Office VARCHAR(10) UNIQUE,
    PRIMARY KEY(p_EMail)
);

CREATE TABLE IF NOT EXISTS Course
(
    c_number VARCHAR(10) NOT NULL,
    c_name VARCHAR(50),
    room VARCHAR(10),
    p_EMail VARCHAR(50),
    PRIMARY KEY(c_number)
);

CREATE TABLE IF NOT EXISTS Student
(
    s_EMail VARCHAR(50) NOT NULL,
    c_number VARCHAR(100),
    major VARCHAR(10),
    PRIMARY KEY(s_EMail)
);

CREATE TABLE IF NOT EXISTS ""Enroll List""
(
    s_EMail VARCHAR(50) NOT NULL,
    c_number VARCHAR(10) NOT NULL,
    PRIMARY KEY(s_EMail, c_number)
);


-- Create FKs
ALTER TABLE Course
    ADD    FOREIGN KEY (p_EMail)
    REFERENCES Professor(p_EMail)
    MATCH SIMPLE
;
    
ALTER TABLE "Enroll List"
    ADD    FOREIGN KEY (s_EMail)
    REFERENCES Student(s_EMail)
    MATCH SIMPLE
;
    
ALTER TABLE Course
    ADD    FOREIGN KEY (c_number)
    REFERENCES "Enroll List"(c_number)
    MATCH SIMPLE
;
    

-- Create Indexes
CREATE INDEX course_room_Index ON Course (room);
CREATE INDEX e_l_s_email_Index ON ""Enroll List"" (s_EMail);
