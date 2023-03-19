CREATE TABLE employee
(
	employee_id int GENERATED ALWAYS AS IDENTITY,
	employee_name varchar NOT NULL,
	employee_department varchar NOT NULL,
	lead_id int,
	
	CONSTRAINT PK_employee_employee_id PRIMARY KEY(employee_id),
	CONSTRAINT FK_employee_lead_id FOREIGN KEY(lead_id) REFERENCES employee(employee_id)
)