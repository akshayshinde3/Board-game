# BoardgameListingWebApp

## Description
### Jenkins
![Screenshot 2024-03-19 195311](https://github.com/Pramod858/Boardgame/assets/80105491/7b1c9b82-c475-418a-be98-c1de76f6c388)
### Grafana
![Screenshot 2024-03-19 195513](https://github.com/Pramod858/Boardgame/assets/80105491/392cde7f-5d4f-4fc6-a765-75dab6c462b0)
### Prometheus
![Screenshot 2024-03-19 195431](https://github.com/Pramod858/Boardgame/assets/80105491/74ed054c-3f0f-4fc5-95c9-c6790e3492a9)
### SonarQube
![Screenshot 2024-03-19 195258](https://github.com/Pramod858/Boardgame/assets/80105491/8dead89d-0036-4a41-92ae-346b67a0ca98)
### Nexus
![Screenshot 2024-03-19 195245](https://github.com/Pramod858/Boardgame/assets/80105491/5b48546b-a661-4db8-a299-281406479246)
### Website
![Screenshot 2024-03-19 195234](https://github.com/Pramod858/Boardgame/assets/80105491/ceb600a5-b2b4-4f85-8bf3-35fd4686bfbe)





**Board Game Database Full-Stack Web Application.**
This web application displays lists of board games and their reviews. While anyone can view the board game lists and reviews, they are required to log in to add/ edit the board games and their reviews. The 'users' have the authority to add board games to the list and add reviews, and the 'managers' have the authority to edit/ delete the reviews on top of the authorities of users.  

## Technologies

- Java
- Spring Boot
- Amazon Web Services(AWS) EC2
- Thymeleaf
- Thymeleaf Fragments
- HTML5
- CSS
- JavaScript
- Spring MVC
- JDBC
- H2 Database Engine (In-memory)
- JUnit test framework
- Spring Security
- Twitter Bootstrap
- Maven

## Features

- Full-Stack Application
- UI components created with Thymeleaf and styled with Twitter Bootstrap
- Authentication and authorization using Spring Security
  - Authentication by allowing the users to authenticate with a username and password
  - Authorization by granting different permissions based on the roles (non-members, users, and managers)
- Different roles (non-members, users, and managers) with varying levels of permissions
  - Non-members only can see the boardgame lists and reviews
  - Users can add board games and write reviews
  - Managers can edit and delete the reviews
- Deployed the application on AWS EC2
- JUnit test framework for unit testing
- Spring MVC best practices to segregate views, controllers, and database packages
- JDBC for database connectivity and interaction
- CRUD (Create, Read, Update, Delete) operations for managing data in the database
- Schema.sql file to customize the schema and input initial data
- Thymeleaf Fragments to reduce redundancy of repeating HTML elements (head, footer, navigation)

## How to Run

1. Clone the repository
2. Open the project in your IDE of choice
3. Run the application
4. To use initial user data, use the following credentials.
  - username: bugs    |     password: bunny (user role)
  - username: daffy   |     password: duck  (manager role)
5. You can also sign-up as a new user and customize your role to play with the application! 😊
