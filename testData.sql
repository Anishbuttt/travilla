

-- Sample Data for User Table
INSERT INTO User (Username, Password, Email, RegistrationDate) VALUES 
('john_doe', 'password123', 'john@example.com', NOW()),
('jane_smith', 'securepassword', 'jane@example.com', NOW()),
('travel_lover', 'mypassword', 'traveler@example.com', NOW());



-- Sample Data for Hotel Table
INSERT INTO Hotel (HotelName, LocationID, Price, Rating) VALUES 
('Hotel Paris', 1, 150.00, 4.5),
('Beijing Grand Hotel', 2, 120.00, 4.0),
('Machu Picchu Sanctuary Lodge', 3, 300.00, 5.0);

-- Sample Data for BucketList Table
INSERT INTO BucketList (UserID, ListName, Privacy, CreationDate) VALUES 
(1, 'Europe Trip', 'Public', NOW()),
(2, 'Asia Adventure', 'Private', NOW()),
(1, 'South America Exploration', 'Public', NOW());

-- Sample Data for BucketListLocations Table
INSERT INTO BucketListLocations (BucketListID, LocationID) VALUES 
(1, 1),  -- Eiffel Tower in Europe Trip
(1, 2),  -- Great Wall of China in Europe Trip
(2, 3);  -- Machu Picchu in Asia Adventure

-- Sample Data for Journal Table
INSERT INTO Journal (UserID, JournalName, Privacy, CreationDate) VALUES 
(1, 'My Travels', 'Public', NOW()),  
(2, 'Family Adventures', 'Private', NOW());

-- Sample Data for JournalEntries Table
INSERT INTO JournalEntries (JournalID, LocationID, EntryText, Photos, DateVisited, CreatedAt) VALUES 
(1, 1, 'Visited the Eiffel Tower; the view was breathtaking!', 'url/to/photo1.jpg', '2024-05-10', NOW()),
(1, 2, 'Hiking on the Great Wall was an unforgettable experience.', 'url/to/photo2.jpg', '2024-05-12', NOW()),
(2, 3, 'Machu Picchu was the highlight of our trip!', 'url/to/photo3.jpg', '2024-05-15', NOW());

-- Sample Data for LocationReviews Table
INSERT INTO LocationReviews (LocationID, UserID, Rating, Comment, SubmissionDate) VALUES 
(1, 1, 5, 'Absolutely stunning! A must-visit!', NOW()),
(2, 2, 4, 'Great experience, but very crowded.', NOW()),
(3, 1, 5, 'The history and scenery are incredible!', NOW());

-- Sample Data for HotelReviews Table
INSERT INTO HotelReviews (HotelID, UserID, Rating, Comment, SubmissionDate) VALUES 
(1, 1, 4, 'Comfortable stay with excellent service.', NOW()),
(2, 2, 5, 'Best hotel I have ever stayed in!', NOW()),
(3, 1, 3, 'Good location but overpriced.', NOW());
