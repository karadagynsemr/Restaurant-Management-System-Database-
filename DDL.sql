-- Customers Table
CREATE TABLE Customers (
    ID SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15) UNIQUE,
    password VARCHAR(255) NOT NULL
);

-- Tables Table
CREATE TABLE Tables (
    ID SERIAL PRIMARY KEY,
    capacity INT NOT NULL,
    status TEXT DEFAULT 'empty' CHECK (status IN ('reserved', 'empty'))
);

-- Roles Table
CREATE TABLE Roles (
    ID SERIAL PRIMARY KEY,
    roleName TEXT NOT NULL CHECK (roleName IN ('manager', 'waiter', 'cooker'))
);

-- Staff Table
CREATE TABLE Staff (
    ID SERIAL PRIMARY KEY,
    role_id INT NOT NULL,
    name VARCHAR(50) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    phone_number VARCHAR(15),
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    FOREIGN KEY (role_id) REFERENCES Roles(ID) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Reservations Table
CREATE TABLE Reservations (
    ID SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    date DATE NOT NULL,
    time TIME NOT NULL,
    table_id INT,
    in_restaurant BOOLEAN DEFAULT FALSE,
    call_waiter BOOLEAN DEFAULT FALSE,
    advance_payment BOOLEAN DEFAULT FALSE,
    status TEXT DEFAULT 'waiting' CHECK (status IN ('waiting','active', 'completed', 'canceled')),
    order_status TEXT CHECK (order_status IN ('order taken', 'cooking', 'ready to serve', 'served')),
    FOREIGN KEY (customer_id) REFERENCES Customers(ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (table_id) REFERENCES Tables(ID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Notifications Table
CREATE TABLE Notifications (
    ID SERIAL PRIMARY KEY,
    notification_type TEXT NOT NULL CHECK (notification_type IN ('call_waiter', 'reservation update')),
    reservation_id INT NOT NULL,
    text TEXT,
    FOREIGN KEY (reservation_id) REFERENCES Reservations(ID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Payments Table
CREATE TABLE Payments (
    ID SERIAL PRIMARY KEY,
    reservation_id INT NOT NULL,
    payment_method TEXT NOT NULL CHECK (payment_method IN ('card', 'online', 'cash')),
    status TEXT DEFAULT 'pending' CHECK (status IN ('pending', 'canceled', 'not paid', 'completed')),
    amount DECIMAL(10, 2) NOT NULL,
    date TIMESTAMP NOT NULL,
    FOREIGN KEY (reservation_id) REFERENCES Reservations(ID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Reviews Table
CREATE TABLE Reviews (
    ID SERIAL PRIMARY KEY,
    reservation_id INT NOT NULL,
    food_rate INT CHECK (food_rate >= 0 AND food_rate <= 5),
    staff_rate INT CHECK (staff_rate >= 0 AND staff_rate <= 5),
    restaurant_rate INT CHECK (restaurant_rate >= 0 AND restaurant_rate <= 5),
    comment TEXT,
    FOREIGN KEY (reservation_id) REFERENCES Reservations(ID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Categories Table
CREATE TABLE Categories (
    ID SERIAL PRIMARY KEY,
    category_name TEXT NOT NULL CHECK (category_name IN ('food', 'drinks', 'desserts'))
);

-- Menu Table
CREATE TABLE Menu (
    ID SERIAL PRIMARY KEY,
    category_id INT NOT NULL,
    itemName VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    allergens VARCHAR(255),
    FOREIGN KEY (category_id) REFERENCES Categories(ID) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Orders Table
CREATE TABLE Orders (
    ID SERIAL PRIMARY KEY,
    ItemName VARCHAR(100) NOT NULL,
    quantity INT NOT NULL,
    reservation_id INT NOT NULL,
    FOREIGN KEY (reservation_id) REFERENCES Reservations(ID) ON DELETE CASCADE ON UPDATE CASCADE
);