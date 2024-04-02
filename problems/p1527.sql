CREATE TABLE IF NOT EXISTS patients (
  patient_id int primary key,
  patient_name varchar(255) not null,
  conditions varchar(255)
);

INSERT INTO patients (
  patient_id,
  patient_name,
  conditions
)
VALUES
  (1,'Daniel','YFEV COUGH'),
  (2,'Alice',null),
  (3,'Bob','DIAB100 MYOP'),
  (4,'George','ACNE DIAB100'),
  (5,'Alain','DIAB201');

---

select
  *
from patients
where conditions ~ '(^|\s)DIAB1'
