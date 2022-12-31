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
[![stars][stars-shield]][stars-url]
[![issues][issues-shield]][issues-url]
[![commits][commits-shield]][commits-url]
[![pulls][pulls-shield]][pulls-url]
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
- [Installation](https://github.com/Erwin-R/MovieProject#installation)
- [Usage](https://github.com/Erwin-R/MovieProject#usage)
- [Credits](https://github.com/Erwin-R/MovieProject#credits)

## Prerequisites
- [Spring Tool Suite](https://spring.io/tools)
- [MySQL](https://downloads.mysql.com/archives/community/)(Mac)
- [MySQL](https://dev.mysql.com/downloads/windows/installer/8.0.html)(Windows)
- [MySQL Workbench](https://dev.mysql.com/downloads/workbench/#downloads)

## Installation
1. Clone the repo
```
git clone https://github.com/your_username/MovieProject.git
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

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/Erwin-R/MovieProject.svg?style=for-the-badge
[contributors-url]: https://github.com/Erwin-R/MovieProject/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/github_username/repo_name.svg?style=for-the-badge
[forks-url]: https://github.com/github_username/repo_name/network/members
[stars-shield]: https://img.shields.io/github/stars/github_username/repo_name.svg?style=for-the-badge
[stars-url]: https://github.com/github_username/repo_name/stargazers
[issues-shield]: https://img.shields.io/github/issues/github_username/repo_name.svg?style=for-the-badge
[issues-url]: https://github.com/github_username/repo_name/issues
[license-shield]: https://img.shields.io/github/license/github_username/repo_name.svg?style=for-the-badge
[license-url]: https://github.com/github_username/repo_name/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/linkedin_username
[product-screenshot]: images/screenshot.png
[Next.js]: https://img.shields.io/badge/next.js-000000?style=for-the-badge&logo=nextdotjs&logoColor=white
[Next-url]: https://nextjs.org/
[React.js]: https://img.shields.io/badge/React-20232A?style=for-the-badge&logo=react&logoColor=61DAFB
[React-url]: https://reactjs.org/
[Vue.js]: https://img.shields.io/badge/Vue.js-35495E?style=for-the-badge&logo=vuedotjs&logoColor=4FC08D
[Vue-url]: https://vuejs.org/
[Angular.io]: https://img.shields.io/badge/Angular-DD0031?style=for-the-badge&logo=angular&logoColor=white
[Angular-url]: https://angular.io/
[Svelte.dev]: https://img.shields.io/badge/Svelte-4A4A55?style=for-the-badge&logo=svelte&logoColor=FF3E00
[Svelte-url]: https://svelte.dev/
[Laravel.com]: https://img.shields.io/badge/Laravel-FF2D20?style=for-the-badge&logo=laravel&logoColor=white
[Laravel-url]: https://laravel.com
[Bootstrap.com]: https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white
[Bootstrap-url]: https://getbootstrap.com
[JQuery.com]: https://img.shields.io/badge/jQuery-0769AD?style=for-the-badge&logo=jquery&logoColor=white
[JQuery-url]: https://jquery.com 
