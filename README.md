# MidtermProject

<img src="https://i.ibb.co/0nVvFjS/Witcher-Readmelogo.webp">

<strong> Created by: Zach Nyman, Johnelle Walker, and Dylan Beppler</strong><br>

# <h2>Description</h2><br>

This class project presents an interactive game based on a custom-created SQL database. The game is designed to immerse players in a fantasy world reminiscent of the Witcher series, offering engaging gameplay experiences through a web application. Players navigate various locations, encounter monsters, and utilize weapons, each implemented as Java Persistence API (JPA) entities. The core of the game lies in the strategic use of resources to overcome challenges posed by the monsters and the environment.

# <h2>Lessons Learned</h2><br>

Throughout the project, our team gained valuable insights into the intricacies of full-stack development. We learned to:<br><br>

Integrate JPA and Hibernate for object-relational mapping, which streamlined database interactions and entity management.<br><br>
Employ Spring MVC patterns to handle web requests and navigate between different views dynamically.<br><br>
Utilize Spring Service and Data Access Object (DAO) layers to encapsulate business logic and data access respectively, fostering a clear separation of concerns.<br><br>
Implement robust front-end interactions using JSP and Servlets, enhancing the user interface and user experience.<br><br>
Create and manipulate a SQL database using MySQL Workbench, which served as the backbone for persistent data storage.<br><br>
The project also provided a practical understanding of agile development practices, version control using Git, and effective team collaboration and communication.<br><br>

# <h2>Tech Used</h2><br>

The project was developed using a diverse set of technologies:<br>

<strong>Spring Boot</strong><br>
<strong>Hibernate</strong><br>
<strong>MySQL Workbench</strong><br>
<strong>Java Persistence API (JPA)</strong><br>
<strong>Spring MVC Framework</strong><br>
<strong>JavaServer Pages (JSP)</strong><br>
<strong>JUnit</strong><br>
<strong>CSS/Bootstrap</strong><br>
<strong>JavaScript</strong><br>

# <h2>AWS Deployment</h2><br>
http://3.13.90.222:8080/BootWitcherOldWorld/ 


# <h2>How To Use</h2><br>

<strong>Install prerequisites:</strong><br>
Make sure you have Java JDK and MySQL installed on your system.
Install Gradle, following the instructions on the official Gradle website.<br>
<strong>Clone the repository:</strong><br>
Obtain the project repository URL and clone it to your local machine using git clone https://github.com/Znyman/MidtermProject.git <br>
<strong>Initialize the database:</strong><br>
The witcherdb.sql file is located in the DB folder inside of the project.
Launch terminal and type: mysql -u root -p < witcherdb.sql <br>
<strong>Build the project:</strong><br>
Open a terminal in the project root directory.
Run gradle build to compile the project and assemble the JAR file. <br>
<strong>Run the application:</strong><br>
After a successful build, start the application with gradle bootRun.
The Spring Boot server will start, and the application will be available at localhost:8083 or the host you have set in the application.properties file.