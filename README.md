# sql-challenge
A challenge focused on data modeling, data engineering, and data analysis. It's goal is to retrieve specific information about employees, whom some company employed during the 1980s and 1990s, having 6 six CSV files as an input.<br>
## Repository Contents
  - **EmployeeSQL** directory contains:
    - *Tables_Creation.sql* SQL script for creating table schemas  <br>
    - *Data_Analysis_Employees.sql* SQL script containing various queries <br>
  - **Data** directory contains 6 CSV files, used as an input data <br>
  - **Output** directory contains the images of:
    - ERD of employees' related data. Would like to notice, that the data in csv files, assumes that the history of changes is not kept, which is unlikely for real businesses (e.g. if employee changed their title from Engineer to Senior Engineer, then it's unclear how long they have been in this title; salary was most likely changed accordingly...). Also seems that only one-to-one relationships are expected within answers, which may not align with the actual data in some cases (e.g. an employee working in multiple departments) <br>
    - Images, which represent the results of SQL queries  <br>
All the outputs are duplicated here, in README file, as well.
## Resources
 - [string analysis](https://www.w3schools.com/sql/sql_like.asp)
 - [analysis Date data type](https://www.postgresqltutorial.com/postgresql-date-functions/postgresql-extract/)
## Installation
Having PostgreSQL (preferable, version 14.9 or later) installed on your machine,  copy the scripts from 'EmployeeSQL' directory to your local machine
## Usage
 - Create a new database and populate it with tables using the *Tables_Creation.sql* script;
 - Import data from *Data* directory one by one (be sure to use same order as for creation of respective tables). The name of each CSV file corresponds to a table name.
 - Execute the queries in the *Data_Analysis_Employees.sql* script using your PostgreSQL client.
## Output
