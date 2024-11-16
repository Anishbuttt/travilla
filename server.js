// server.js
const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const mysql = require('mysql2');

const app = express();
const port = 3000;

// Middleware
app.use(cors());
app.use(bodyParser.json());

// Create a connection to the MySQL database 
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root', // Replace with your MySQL username
    password: '1407', // Replace with your MySQL password
    database: 'travelguide' // Replace with your database name
});

// Connect to the database
db.connect(err => {
    if (err) throw err;
    console.log('Connected to the database');
});

// Sample endpoint
app.get('/', (req, res) => {
    res.send('Welcome to the Travel Guide API');
});

// Start server
app.listen(port, () => {
    console.log(`Server is running on http://localhost:${port}`);
});

// Register User
app.post('/register', (req, res) => {
    const { username, email, password } = req.body;
    const sql = 'INSERT INTO User (Username, Email, Password) VALUES (?, ?, ?)';
    db.query(sql, [username, email, password], (err, result) => {
        if (err) throw err;
        res.send({ message: 'User registered successfully!', userId: result.insertId });
    });
});

// Login User
app.post('/login', (req, res) => {
    const { email, password } = req.body;
    const sql = 'SELECT * FROM User WHERE Email = ? AND Password = ?';
    db.query(sql, [email, password], (err, result) => {
        if (err) throw err;
        if (result.length > 0) {
            res.send({ message: 'Login successful!', user: result[0] });
        } else {
            res.status(401).send({ message: 'Invalid credentials!' });
        }
    });
});


// Location Management Endpoints

// Add a New Location
app.post('/locations', (req, res) => {
    const { locationName, country, city,description } = req.body;
    const sql = 'INSERT INTO Location (LocationName, Country, City,  Description) VALUES (?, ?, ?, ?)';
    db.query(sql, [locationName, country, city, description], (err, result) => {
        if (err) {
            console.error('Error adding location:', err);
            return res.status(500).send({ message: 'Error adding location' });
        }
        res.send({ message: 'Location added successfully!', locationId: result.insertId });
    });
});

// Get All Locations
app.get('/locations', (req, res) => {
    const sql = 'SELECT * FROM Location';
    db.query(sql, (err, results) => {
        if (err) {
            console.error('Error fetching locations:', err);
            return res.status(500).send({ message: 'Error fetching locations' });
        }
        res.send(results);
    });
});

// Update a Location
app.put('/update-location/:id', (req, res) => {
    const { id } = req.params;
    const { locationName, country, city, description } = req.body;
    const sql = 'UPDATE Location SET LocationName = ?, Country = ?, City = ?,  Description = ? WHERE LocationID = ?';
    db.query(sql, [locationName, country, city, description, id], (err, result) => {
        if (err) {
            console.error('Error updating location:', err);
            return res.status(500).send({ message: 'Error updating location' });
        }
        res.send({ message: 'Location updated successfully!' });
    });
});

// Delete a Location
app.delete('/delete-location/:id', (req, res) => {
    const { id } = req.params;
    const sql = 'DELETE FROM Location WHERE LocationID = ?';
    db.query(sql, [id], (err, result) => {
        if (err) {
            console.error('Error deleting location:', err);
            return res.status(500).send({ message: 'Error deleting location' });
        }
        res.send({ message: 'Location deleted successfully!' });
    });
});
