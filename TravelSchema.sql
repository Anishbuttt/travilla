-- 1. User Table
CREATE TABLE User (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(50) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    RegistrationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Location Table
CREATE TABLE Location (
    LocationID INT PRIMARY KEY AUTO_INCREMENT,
    LocationName VARCHAR(100) NOT NULL,
    Country VARCHAR(50) NOT NULL,
    City VARCHAR(50) NOT NULL,  -- Added City column
  
    Description TEXT
);

-- 3. Hotel Table
CREATE TABLE Hotel (
    HotelID INT PRIMARY KEY AUTO_INCREMENT,
    HotelName VARCHAR(100) NOT NULL,
    LocationID INT,
    Price DECIMAL(10, 2),
    Rating DECIMAL(2, 1),
    FOREIGN KEY (LocationID) REFERENCES Location(LocationID) ON DELETE SET NULL
);

-- 4. BucketList Table
CREATE TABLE BucketList (
    ListID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT NOT NULL,
    ListName VARCHAR(100) NOT NULL,
    Privacy ENUM('Public', 'Private') DEFAULT 'Private',
    CreationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES User(UserID) ON DELETE CASCADE
);

-- 5. BucketListLocations Table (Many-to-Many Relationship between BucketList and Location)
CREATE TABLE BucketListLocations (
    BucketListID INT,
    LocationID INT,
    PRIMARY KEY (BucketListID, LocationID),
    FOREIGN KEY (BucketListID) REFERENCES BucketList(ListID) ON DELETE CASCADE,
    FOREIGN KEY (LocationID) REFERENCES Location(LocationID) ON DELETE CASCADE
);

-- 6. Journal Table
CREATE TABLE Journal (
    JournalID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT NOT NULL,
    JournalName VARCHAR(100) NOT NULL,
    Privacy ENUM('Public', 'Private') DEFAULT 'Private',
    CreationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES User(UserID) ON DELETE CASCADE
);

-- 7. JournalEntries Table (One-to-Many Relationship with Journal)
CREATE TABLE JournalEntries (
    EntryID INT PRIMARY KEY AUTO_INCREMENT,
    JournalID INT NOT NULL,
    LocationID INT NOT NULL,  -- Keeping NOT NULL for LocationID
    EntryText TEXT,
    Photos VARCHAR(255),  -- Assuming Photos as a URL or file path reference
    DateVisited DATE,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (JournalID) REFERENCES Journal(JournalID) ON DELETE CASCADE,
    FOREIGN KEY (LocationID) REFERENCES Location(LocationID) ON DELETE CASCADE  -- Change to CASCADE
);


-- 8. LocationReviews Table
CREATE TABLE LocationReviews (
    ReviewID INT PRIMARY KEY AUTO_INCREMENT,
    LocationID INT NOT NULL,
    UserID INT NOT NULL,
    Rating DECIMAL(2, 1) CHECK (Rating >= 1.0 AND Rating <= 5.0),
    Comment TEXT,
    SubmissionDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (LocationID) REFERENCES Location(LocationID) ON DELETE CASCADE,
    FOREIGN KEY (UserID) REFERENCES User(UserID) ON DELETE CASCADE
);

-- 9. HotelReviews Table
CREATE TABLE HotelReviews (
    ReviewID INT PRIMARY KEY AUTO_INCREMENT,
    HotelID INT NOT NULL,
    UserID INT NOT NULL,
    Rating DECIMAL(2, 1) CHECK (Rating >= 1.0 AND Rating <= 5.0),
    Comment TEXT,
    SubmissionDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (HotelID) REFERENCES Hotel(HotelID) ON DELETE CASCADE,
    FOREIGN KEY (UserID) REFERENCES User(UserID) ON DELETE CASCADE
);
