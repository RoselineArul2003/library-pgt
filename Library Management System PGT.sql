CREATE DATABASE LibraryDB;
USE LibraryDB;

CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255),
    author VARCHAR(255),
    genre VARCHAR(100),
    published_year INT,
    price DECIMAL(10,2),
    available_copies INT
);
INSERT INTO Books (title, author, genre, published_year, price, available_copies) VALUES
('The Catcher in the Rye', 'J.D. Salinger', 'Fiction', 1951, 12.99, 5),
('To Kill a Mockingbird', 'Harper Lee', 'Fiction', 1960, 10.99, 7),
('1984', 'George Orwell', 'Dystopian', 1949, 15.50, 10),
('Moby-Dick', 'Herman Melville', 'Adventure', 1851, 17.99, 4),
('Pride and Prejudice', 'Jane Austen', 'Romance', 1813, 8.99, 6),
('The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', 1925, 14.99, 3),
('War and Peace', 'Leo Tolstoy', 'Historical', 1869, 20.99, 2),
('Hamlet', 'William Shakespeare', 'Drama', 1603, 9.99, 8),
('The Odyssey', 'Homer', 'Epic', -700, 11.50, 12),
('Crime and Punishment', 'Fyodor Dostoevsky', 'Psychological', 1866, 13.50, 5),
('Brave New World', 'Aldous Huxley', 'Dystopian', 1932, 16.99, 4),
('The Hobbit', 'J.R.R. Tolkien', 'Fantasy', 1937, 18.50, 9),
('The Lord of the Rings', 'J.R.R. Tolkien', 'Fantasy', 1954, 25.99, 6),
('The Divine Comedy', 'Dante Alighieri', 'Epic', 1320, 19.99, 3),
('Don Quixote', 'Miguel de Cervantes', 'Adventure', 1605, 14.50, 2),
('One Hundred Years of Solitude', 'Gabriel García Márquez', 'Magical Realism', 1967, 21.99, 7),
('The Brothers Karamazov', 'Fyodor Dostoevsky', 'Philosophical', 1880, 15.99, 6),
('Anna Karenina', 'Leo Tolstoy', 'Romance', 1877, 18.99, 8),
('Wuthering Heights', 'Emily Brontë', 'Gothic', 1847, 11.99, 4),
('The Iliad', 'Homer', 'Epic', -750, 12.50, 10),
('Great Expectations', 'Charles Dickens', 'Fiction', 1861, 14.99, 5),
('Frankenstein', 'Mary Shelley', 'Gothic', 1818, 9.99, 7),
('Dracula', 'Bram Stoker', 'Horror', 1897, 13.99, 4),
('The Stranger', 'Albert Camus', 'Philosophical', 1942, 10.50, 6),
('The Metamorphosis', 'Franz Kafka', 'Absurdist', 1915, 8.99, 9),
('Fahrenheit 451', 'Ray Bradbury', 'Dystopian', 1953, 14.50, 5),
('Heart of Darkness', 'Joseph Conrad', 'Psychological', 1899, 11.50, 6),
('The Grapes of Wrath', 'John Steinbeck', 'Historical', 1939, 16.99, 3),
('Jane Eyre', 'Charlotte Brontë', 'Romance', 1847, 12.99, 4),
('Les Misérables', 'Victor Hugo', 'Historical', 1862, 18.50, 5);

-- Querying Data (DQL - Data Query Language)
-- Retrieve All Books
SELECT * FROM Books;

-- Retrieve Books by a Specific Author
SELECT * FROM Books WHERE author = 'Leo Tolstoy';

-- Filtering Operations
-- Find Books Published After 1950
SELECT * FROM Books WHERE published_year > 1950;

-- Find Books Priced Between 10 and 20
SELECT * FROM Books WHERE price BETWEEN 10 AND 20;

-- Sorting Operations
-- Sort Books by Price in Ascending Order
SELECT * FROM Books ORDER BY price ASC;

-- Sort Books by Published Year in Descending Order
SELECT * FROM Books ORDER BY published_year DESC;

-- Aggregate Functions
-- Count the Number of Books in the Library
SELECT COUNT(*) AS total_books FROM Books;

-- Find the Average Price of Books
SELECT AVG(price) AS avg_price FROM Books;

-- Find the Most Expensive Book
SELECT title, price FROM Books ORDER BY price DESC LIMIT 1;

-- String Functions
-- Convert All Book Titles to Uppercase
SELECT UPPER(title) AS upper_title FROM Books;

-- Find Length of Each Book Title
SELECT title, LENGTH(title) AS title_length FROM Books;

-- Using LIKE (Pattern Matching)
-- Find Books with "The" in Title
SELECT * FROM Books WHERE title LIKE '%The%';

-- Find Authors Whose Names Start with 'J'
SELECT * FROM Books WHERE author LIKE 'J%';

-- Create a Table for Borrowers
CREATE TABLE Borrowers (
    borrower_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    book_id INT,
    borrow_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

INSERT INTO Borrowers (name, book_id, borrow_date, return_date) VALUES
('Alice Johnson', 1, '2025-01-10', '2025-01-25'),
('Bob Smith', 3, '2025-01-12', '2025-01-28'),
('Charlie Brown', 5, '2025-01-15', '2025-02-01');

-- INNER JOIN / Query: Retrieve Borrower Details and Corresponding Book Information
SELECT Borrowers.name, Books.title, Borrowers.borrow_date, Borrowers.return_date
FROM Borrowers
INNER JOIN Books ON Borrowers.book_id = Books.book_id;

-- LEFT JOIN (or LEFT OUTER JOIN) / Query: Retrieve All Books and Borrower Information (If Any)
SELECT Books.title, Borrowers.name, Borrowers.borrow_date
FROM Books
LEFT JOIN Borrowers ON Books.book_id = Borrowers.book_id;

-- RIGHT JOIN (or RIGHT OUTER JOIN) / Query: Retrieve All Borrowers and Their Borrowed Books (If Any)
SELECT Borrowers.name, Books.title, Borrowers.borrow_date
FROM Borrowers
RIGHT JOIN Books ON Borrowers.book_id = Books.book_id;


