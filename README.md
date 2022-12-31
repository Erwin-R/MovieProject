# Movie Spree
<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->
<a name="readme-top"></a>
<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Don't forget to give the project a star!
*** Thanks again! Now go create something AMAZING! :D
-->



<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![contributors][contributors-shield]][contributors-url]
[![forks][forks-shield]][forks-url]
[![issues][issues-shield]][issues-url]
[![commits][commits-shield]][commits-url]
[![pulls][pulls-shield]][pulls-url]

*Get in touch with us!*

- Erwin - [![linkedIn][linkedin-shield]][linkedin-url]

- Brandon - [![Brandon][brandon-shield]][brandon-url]

- Eloy - [![Eloy][eloy-shield]][eloy-url]

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
<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Built With

This section should list any major frameworks/libraries used to bootstrap your project.

* ![java][java]
* ![React][React.js]
* ![Laravel][Laravel.com]
* ![css][css]
* ![JQuery][JQuery.com]
* ![MySQL.com][MySQL.com]

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Demo Video
Coming Soon
<br>
<br>
## Table of Contents
- [Prerequisites](https://github.com/Erwin-R/MovieProject/blob/main/README.md#prerequisites)
- [Installation](https://github.com/Erwin-R/MovieProject#installation)
- [Usage](https://github.com/Erwin-R/MovieProject#usage)
- [Credits](https://github.com/Erwin-R/MovieProject#credits)

## Prerequisites
- [Spring Tool Suite](https://spring.io/tools)
- [MySQL](https://downloads.mysql.com/archives/community/)(Mac)
- [MySQL](https://dev.mysql.com/downloads/windows/installer/8.0.html)(Windows)
- [MySQL Workbench](https://dev.mysql.com/downloads/workbench/#downloads)

## Installation
1. Get a free API key at [themoviedb.org](https://developers.themoviedb.org/3/getting-started/introduction)
2. Clone the repo
```
git clone https://github.com/your_username/MovieProject.git
```
3. Change the following code block in the application.properties files to match your application
```
spring.datasource.url=jdbc:mysql://localhost:3306/YOUR_PROJECT_NAME
spring.datasource.username= YOUR_USER_NAME
spring.datasource.password= YOUR_USER_PASSWORD
spring.mail.username=YOUR_USER_EMAIL
spring.mail.password= YOUR_USER_PASSWORD
```
4. Enter your API key in the Home Controller file on these lines
```
TmdbMovies movies = new TmdbApi("your_API_KEY").getMovies();
TmdbSearch movies = new TmdbApi("your_API_KEY").getSearch();
TmdbPeople people = new TmdbApi("your_API_KEY").getPeople();
```
<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Usage
1. Run the application inside of Spring Tool Suite or you can use the Spring Tools Suite extension for VS Code. If on Spring tool suite, right click on project name, then click on "Run As"-> "Spring Boot App". If on VS code, right click on home controller and then click on "Run Java".
2. Open a browser and go to [http://localhost:8080](http://localhost:8080).
3. This is the home page of Movie Spree. While users can browse and search movies on our site, they will need to create an account to add movies to a watchlist and leave comments on movies.

![image](https://user-images.githubusercontent.com/108560020/210153891-b50ff5c7-3653-4291-a8ee-1b3abb7b780a.png)

4. Users can view information about a movie such as the cast, directors, writers, etc. Users are also able to view view information about cast and directors by clicking on their names/images.

![image](https://user-images.githubusercontent.com/108560020/210154022-82a14d0c-ab98-4274-95b8-fb3c59116661.png)
![image](https://user-images.githubusercontent.com/108560020/210154030-3a7dc7fb-6408-477f-b03b-dae7b7c5e8f9.png)

5. Clicking on the *Trending* tab on the navbar will take users to the trending movies page. From here users will be able to see current trending movies in real-time.

![image](https://user-images.githubusercontent.com/108560020/210154185-5afb9f80-8212-41fb-8fbb-7b835cd07c4a.png)

6. As seen on the movie details and trending movies page, users can add movies to a watchlist. They are also able to remove movies from the watchlist.

![image](https://user-images.githubusercontent.com/108560020/210154317-c2b3d7f9-eeec-4d9d-bc7e-4af8e7acb760.png)

7. There is also a search function on our website where users can search for movies they're interested in.

![image](https://user-images.githubusercontent.com/108560020/210154378-9902cc67-6665-4655-bd49-f9298e21499e.png)


<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Credits
Special thanks to my groupmates Eloy Vigil ([https://github.com/EloyVigil](https://github.com/EloyVigil)) and Brandon Borchert ([https://github.com/bjborchert93](https://github.com/bjborchert93)) for helping this project come to life!

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/Erwin-R/MovieProject.svg?style=for-the-badge
[contributors-url]: https://github.com/Erwin-R/MovieProject/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/Erwin-R/MovieProject.svg?style=for-the-badge
[forks-url]: https://github.com/Erwin-R/MovieProject/network/members
[issues-shield]: https://img.shields.io/github/issues/Erwin-R/MovieProject.svg?style=for-the-badge
[issues-url]: https://github.com/Erwin-R/MovieProject/issues

[commits-shield]: https://img.shields.io/github/commits-since/Erwin-R/MovieProject/6956.svg
[commits-url]: https://github.com/Erwin-R/MovieProject/commits
[pulls-shield]: https://img.shields.io/github/issues-pr-closed/Erwin-R/MovieProject.svg
[pulls-url]: https://github.com/Erwin-R/MovieProject/pulls
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/erwin-rosales-724334253
[brandon-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[brandon-url]: https://linkedin.com/in/brandon-borchert
[eloy-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[eloy-url]: https://linkedin.com/in/eloy-vigil

[product-screenshot]: images/screenshot.png
[java]: https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=java&logoColor=white
[React.js]: https://img.shields.io/badge/Spring-6DB33F?style=for-the-badge&logo=spring&logoColor=white
[Laravel.com]:https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white
[css]:https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white
[JQuery.com]: https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black
[mySQL.com]: https://img.shields.io/badge/MySQL-005C84?style=for-the-badge&logo=mysql&logoColor=white
