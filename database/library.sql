CREATE DATABASE IF NOT EXISTS library_management;
USE library_management;

CREATE TABLE IF NOT EXISTS users (id INT PRIMARY KEY AUTO_INCREMENT,name VARCHAR(100) NOT NULL,email VARCHAR(120) NOT NULL UNIQUE,password VARCHAR(255) NOT NULL,role VARCHAR(30) NOT NULL DEFAULT 'MEMBER');
CREATE TABLE IF NOT EXISTS books (id INT PRIMARY KEY AUTO_INCREMENT,title VARCHAR(150) NOT NULL,author VARCHAR(120) NOT NULL,category VARCHAR(80),quantity INT NOT NULL DEFAULT 1,available_quantity INT NOT NULL DEFAULT 1);
CREATE TABLE IF NOT EXISTS issued_books (id INT PRIMARY KEY AUTO_INCREMENT,user_id INT NOT NULL,book_id INT NOT NULL,issue_date DATE NOT NULL,return_date DATE NULL,status VARCHAR(30) NOT NULL DEFAULT 'ISSUED',CONSTRAINT fk_issue_user FOREIGN KEY (user_id) REFERENCES users(id),CONSTRAINT fk_issue_book FOREIGN KEY (book_id) REFERENCES books(id));

INSERT INTO users(name,email,password,role) VALUES ('Admin','admin@library.com','admin123','ADMIN') ON DUPLICATE KEY UPDATE name='Admin',role='ADMIN';

-- 100 demo student members
INSERT IGNORE INTO users(name,email,password,role) VALUES
('Aarav Sharma','student001@library.com','student123','MEMBER'),
('Vivaan Verma','student002@library.com','student123','MEMBER'),
('Aditya Singh','student003@library.com','student123','MEMBER'),
('Arjun Kumar','student004@library.com','student123','MEMBER'),
('Rohan Gupta','student005@library.com','student123','MEMBER'),
('Rahul Yadav','student006@library.com','student123','MEMBER'),
('Karan Mishra','student007@library.com','student123','MEMBER'),
('Kabir Saxena','student008@library.com','student123','MEMBER'),
('Ishaan Mehta','student009@library.com','student123','MEMBER'),
('Aryan Joshi','student010@library.com','student123','MEMBER'),
('Dev Sharma','student011@library.com','student123','MEMBER'),
('Yash Verma','student012@library.com','student123','MEMBER'),
('Ansh Singh','student013@library.com','student123','MEMBER'),
('Dhruv Kumar','student014@library.com','student123','MEMBER'),
('Krishna Gupta','student015@library.com','student123','MEMBER'),
('Harsh Yadav','student016@library.com','student123','MEMBER'),
('Aman Mishra','student017@library.com','student123','MEMBER'),
('Nikhil Saxena','student018@library.com','student123','MEMBER'),
('Mohit Mehta','student019@library.com','student123','MEMBER'),
('Sahil Joshi','student020@library.com','student123','MEMBER'),
('Abhishek Sharma','student021@library.com','student123','MEMBER'),
('Varun Verma','student022@library.com','student123','MEMBER'),
('Ritvik Singh','student023@library.com','student123','MEMBER'),
('Manav Kumar','student024@library.com','student123','MEMBER'),
('Pranav Gupta','student025@library.com','student123','MEMBER'),
('Shivam Yadav','student026@library.com','student123','MEMBER'),
('Akash Mishra','student027@library.com','student123','MEMBER'),
('Ayush Saxena','student028@library.com','student123','MEMBER'),
('Raj Mehta','student029@library.com','student123','MEMBER'),
('Rishabh Joshi','student030@library.com','student123','MEMBER'),
('Tanish Sharma','student031@library.com','student123','MEMBER'),
('Aniket Verma','student032@library.com','student123','MEMBER'),
('Siddharth Singh','student033@library.com','student123','MEMBER'),
('Kunal Kumar','student034@library.com','student123','MEMBER'),
('Gaurav Gupta','student035@library.com','student123','MEMBER'),
('Vivek Yadav','student036@library.com','student123','MEMBER'),
('Naveen Mishra','student037@library.com','student123','MEMBER'),
('Piyush Saxena','student038@library.com','student123','MEMBER'),
('Abhinav Mehta','student039@library.com','student123','MEMBER'),
('Lakshay Joshi','student040@library.com','student123','MEMBER'),
('Aditi Sharma','student041@library.com','student123','MEMBER'),
('Ananya Verma','student042@library.com','student123','MEMBER'),
('Priya Singh','student043@library.com','student123','MEMBER'),
('Sneha Kumar','student044@library.com','student123','MEMBER'),
('Neha Gupta','student045@library.com','student123','MEMBER'),
('Riya Yadav','student046@library.com','student123','MEMBER'),
('Isha Mishra','student047@library.com','student123','MEMBER'),
('Kavya Saxena','student048@library.com','student123','MEMBER'),
('Mehak Mehta','student049@library.com','student123','MEMBER'),
('Simran Joshi','student050@library.com','student123','MEMBER'),
('Muskan Sharma','student051@library.com','student123','MEMBER'),
('Sakshi Verma','student052@library.com','student123','MEMBER'),
('Shreya Singh','student053@library.com','student123','MEMBER'),
('Nandini Kumar','student054@library.com','student123','MEMBER'),
('Palak Gupta','student055@library.com','student123','MEMBER'),
('Tanya Yadav','student056@library.com','student123','MEMBER'),
('Diya Mishra','student057@library.com','student123','MEMBER'),
('Avni Saxena','student058@library.com','student123','MEMBER'),
('Manya Mehta','student059@library.com','student123','MEMBER'),
('Anushka Joshi','student060@library.com','student123','MEMBER'),
('Pooja Sharma','student061@library.com','student123','MEMBER'),
('Radhika Verma','student062@library.com','student123','MEMBER'),
('Sanya Singh','student063@library.com','student123','MEMBER'),
('Ishita Kumar','student064@library.com','student123','MEMBER'),
('Navya Gupta','student065@library.com','student123','MEMBER'),
('Kiara Yadav','student066@library.com','student123','MEMBER'),
('Ayesha Mishra','student067@library.com','student123','MEMBER'),
('Bhavya Saxena','student068@library.com','student123','MEMBER'),
('Anjali Mehta','student069@library.com','student123','MEMBER'),
('Komal Joshi','student070@library.com','student123','MEMBER'),
('Payal Sharma','student071@library.com','student123','MEMBER'),
('Nikita Verma','student072@library.com','student123','MEMBER'),
('Tanvi Singh','student073@library.com','student123','MEMBER'),
('Jhanvi Kumar','student074@library.com','student123','MEMBER'),
('Suhani Gupta','student075@library.com','student123','MEMBER'),
('Srishti Yadav','student076@library.com','student123','MEMBER'),
('Apoorva Mishra','student077@library.com','student123','MEMBER'),
('Prisha Saxena','student078@library.com','student123','MEMBER'),
('Myra Mehta','student079@library.com','student123','MEMBER'),
('Aarohi Joshi','student080@library.com','student123','MEMBER'),
('Vansh Sharma','student081@library.com','student123','MEMBER'),
('Parth Verma','student082@library.com','student123','MEMBER'),
('Reyansh Singh','student083@library.com','student123','MEMBER'),
('Atharv Kumar','student084@library.com','student123','MEMBER'),
('Kartik Gupta','student085@library.com','student123','MEMBER'),
('Manish Yadav','student086@library.com','student123','MEMBER'),
('Rajat Mishra','student087@library.com','student123','MEMBER'),
('Deepak Saxena','student088@library.com','student123','MEMBER'),
('Vikas Mehta','student089@library.com','student123','MEMBER'),
('Ravi Joshi','student090@library.com','student123','MEMBER'),
('Sumit Sharma','student091@library.com','student123','MEMBER'),
('Himanshu Verma','student092@library.com','student123','MEMBER'),
('Sachin Singh','student093@library.com','student123','MEMBER'),
('Tarun Kumar','student094@library.com','student123','MEMBER'),
('Ujjwal Gupta','student095@library.com','student123','MEMBER'),
('Saurabh Yadav','student096@library.com','student123','MEMBER'),
('Sumeet Mishra','student097@library.com','student123','MEMBER'),
('Naman Saxena','student098@library.com','student123','MEMBER'),
('Tejas Mehta','student099@library.com','student123','MEMBER'),
('Rhea Joshi','student100@library.com','student123','MEMBER');

-- Demo book catalogue
INSERT INTO books(title,author,category,quantity,available_quantity) SELECT 'Clean Code','Robert C. Martin','Programming',5,5 WHERE NOT EXISTS (SELECT 1 FROM books WHERE title='Clean Code');
INSERT INTO books(title,author,category,quantity,available_quantity) SELECT 'Java: The Complete Reference','Herbert Schildt','Java',6,6 WHERE NOT EXISTS (SELECT 1 FROM books WHERE title='Java: The Complete Reference');
INSERT INTO books(title,author,category,quantity,available_quantity) SELECT 'Database System Concepts','Silberschatz','DBMS',4,4 WHERE NOT EXISTS (SELECT 1 FROM books WHERE title='Database System Concepts');
INSERT INTO books(title,author,category,quantity,available_quantity) SELECT 'Head First Java','Kathy Sierra','Java',5,5 WHERE NOT EXISTS (SELECT 1 FROM books WHERE title='Head First Java');
INSERT INTO books(title,author,category,quantity,available_quantity) SELECT 'The Pragmatic Programmer','Andrew Hunt','Programming',4,4 WHERE NOT EXISTS (SELECT 1 FROM books WHERE title='The Pragmatic Programmer');
INSERT INTO books(title,author,category,quantity,available_quantity) SELECT 'Computer Networks','Andrew S. Tanenbaum','Networking',3,3 WHERE NOT EXISTS (SELECT 1 FROM books WHERE title='Computer Networks');
INSERT INTO books(title,author,category,quantity,available_quantity) SELECT 'Operating System Concepts','Silberschatz','Operating Systems',4,4 WHERE NOT EXISTS (SELECT 1 FROM books WHERE title='Operating System Concepts');
INSERT INTO books(title,author,category,quantity,available_quantity) SELECT 'Introduction to Algorithms','Cormen','DSA',5,5 WHERE NOT EXISTS (SELECT 1 FROM books WHERE title='Introduction to Algorithms');
INSERT INTO books(title,author,category,quantity,available_quantity) SELECT 'Python Crash Course','Eric Matthes','Programming',3,3 WHERE NOT EXISTS (SELECT 1 FROM books WHERE title='Python Crash Course');
INSERT INTO books(title,author,category,quantity,available_quantity) SELECT 'Artificial Intelligence','Stuart Russell','AI',3,3 WHERE NOT EXISTS (SELECT 1 FROM books WHERE title='Artificial Intelligence');
INSERT INTO books(title,author,category,quantity,available_quantity) SELECT 'Design Patterns','Erich Gamma','Software Engineering',3,3 WHERE NOT EXISTS (SELECT 1 FROM books WHERE title='Design Patterns');
INSERT INTO books(title,author,category,quantity,available_quantity) SELECT 'You Don’t Know JS','Kyle Simpson','JavaScript',4,4 WHERE NOT EXISTS (SELECT 1 FROM books WHERE title='You Don’t Know JS');
INSERT INTO books(title,author,category,quantity,available_quantity) SELECT 'Eloquent JavaScript','Marijn Haverbeke','JavaScript',4,4 WHERE NOT EXISTS (SELECT 1 FROM books WHERE title='Eloquent JavaScript');
INSERT INTO books(title,author,category,quantity,available_quantity) SELECT 'System Design Interview','Alex Xu','System Design',3,3 WHERE NOT EXISTS (SELECT 1 FROM books WHERE title='System Design Interview');
INSERT INTO books(title,author,category,quantity,available_quantity) SELECT 'Let Us C','Yashavant Kanetkar','C Programming',5,5 WHERE NOT EXISTS (SELECT 1 FROM books WHERE title='Let Us C');
