

# E-Commerce Bookstore Project

This project is an e-commerce website for a bookstore, allowing users to browse books, add them to their cart, and purchase them online.

## Technologies Used

- **Frontend**: HTML, CSS, JavaScript
- **Backend**: JavaServer Pages (JSP)
- **Database**: MySQL

## Features

- **User Authentication**: Users can create accounts, log in, and log out.
- **Browse Books**: View a list of available books with details.
- **Search and Filters**: Search for books by title, author, category, etc.
- **Shopping Cart**: Add books to a shopping cart and manage items.
- **Checkout**: Process orders securely.
- **Admin Panel**: Manage books (CRUD operations), view orders, and manage users.

# Setup Instructions

### Set up the database:

1. Create a MySQL database named `bookstore`.
2. Import the database schema from `database/bookstore.sql`.

### Configure database connection:

1. Open `src/main/resources/db.properties`.
2. Update the MySQL username and password:

   ```properties
   jdbc.url=jdbc:mysql://localhost:3306/bookstore
   jdbc.username=root
   jdbc.password=rootpassword

### Deployment:

1. Deploy the application on a Java EE server (e.g., Apache Tomcat).
2. Copy the WAR file (e.g., bookstore.war) to the server's deployment directory.
   
### Accessing the Application:

1. Open a web browser and go to http://localhost:8080/bookstore (assuming default Tomcat configuration).
2. You can now explore the bookstore and its features.
   
# Usage

## User Roles:

- **Customer**: Can browse books, add to cart, and purchase.
- **Admin:** Can manage books, view orders, and manage users.
  
## Contributing

Contributions are welcome! Please fork the repository and create a pull request with your suggested changes.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

   
