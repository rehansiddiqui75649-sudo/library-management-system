# Library Management System

Java Web-Based Library Management System for Review 1.

## Stack
Java 17, Servlets, JSP, JDBC, MySQL, Maven, Apache Tomcat 9, HTML/CSS.

## Implemented for Review 1
- Admin login
- Dashboard
- Book listing and search
- Add book
- MySQL schema and sample data
- JDBC connection
- DAO layer
- OOP model classes
- Interface + generics
- Inheritance + polymorphism
- Custom exception handling
- Responsive UI

## Run
1. Install JDK 17, Maven, MySQL and Tomcat 9.
2. Run `database/library.sql` in MySQL Workbench.
3. Edit `DBConnection.java` and set your MySQL password.
4. From the project root run `mvn clean package`.
5. Copy `target/library-management-system.war` to Tomcat 9 `webapps`.
6. Start Tomcat.
7. Open `http://localhost:8080/library-management-system/`

Demo login:
- Email: `admin@library.com`
- Password: `admin123`

## GitHub
Push the whole project folder. Do not push `target/`, IDE folders, or database passwords.
