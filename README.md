# Movie Spree
## Description
A full-stack Java Spring-Based application featuring MySQL, JSP, TMDB API, Java's Smtplib mail library, and SpringBoot. This website's purpose is to serve as an online database that contains information and statistics about films as well as the genre, actors, writers of said film.
This project was created within a one-week sprint with two other software developers.
<br>
<br>
The inspiration behind this project came from the idea that we wanted to create a place for fellow film-buffs to research information about their favorite films as well as share their opinions on movies that they may have seen.
With this idea in mind, the website was made where users can research information on movies that they search for, as well as leave comments on movies that they have seen.
<br>
<br>
During the project, I was responsible for a portion of both the front-end and backend. More specifically, rendering `upcoming`, `in theatres`, `top rated`, and `upcoming` films on the page. I also helped in implementing in the comments feature within the film's details page. In addition, I was also the project manager
that organized agile meetings, oversaw previous day progress reports, and making sure that the project was finished one time.
<br>
<br>
Overall, this was a great development experience for my cohort mates and I! While we encountered many challenges in the process of developing this website, such as collaboration using Github, implementing the TMDB API, and creating complex data models, this project helped sharpen our ability to problem solve and collaborate as a team. It also helped me get better at project management.  

## Demo
Temporary
<br>
<br>
## Table of Contents
- [Prerequisites](https://github.com/Erwin-R/MovieProject/blob/main/README.md#prerequisites)
- Installation
- Usage
- Credits

## Prerequisites
- [Spring Tool Suite](https://spring.io/tools)
- [MySQL](https://downloads.mysql.com/archives/community/)(Mac)
- [MySQL](https://dev.mysql.com/downloads/windows/installer/8.0.html)(Windows)
- [MySQL Workbench](https://dev.mysql.com/downloads/workbench/#downloads)

## Installation
1. Clone the repo
```
git clone https://github.com/Erwin-R/MovieProject.git
```
2. Change the following code block in the application.properties files to match your application
```
spring.datasource.url=jdbc:mysql://localhost:3306/YOUR_PROJECT_NAME
spring.datasource.username= YOUR_USER_NAME
spring.datasource.password= YOUR_USER_PASSWORD
spring.mail.username=YOUR_USER_EMAIL
spring.mail.password= YOUR_USER_PASSWORD
```
## Usage
1. Run the application inside of Spring Tool Suite or you can use the Spring Tools Suite extension for VS Code. If on Spring tool suite, right click on project name, then click on "Run As"-> "Spring Boot App". If on VS code, right click on home controller and then click on "Run Java".
2. Open a browser and go to [http://localhost:8080](http://localhost:8080).

## Credits
Special thanks to my groupmates Eloy Vigil ([https://github.com/EloyVigil](https://github.com/EloyVigil)) and Brandon Borchert ([https://github.com/bjborchert93](https://github.com/bjborchert93)) for helping this project come to life!
