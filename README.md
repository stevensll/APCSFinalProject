# APCSFinalProject
Candy Crush game - APCS Final for Mr. K's period 10 class. 

**Group Name**: Sweet Treats

**Members**: Steven Lei and Ava Lu

## Brief Description ## 
We will be creating a remake of the Candy Crush Saga game using Java and Processing. The game will offer ten levels of increasing difficulty and will incorporate obstacles such as jellies and icings. The goal is to clear all of the obstacles with a limited number of moves. The user will also be able to create special combos using striped candies that can clear a row or column. Each map will be manually created with a set candy placement and as the game progresses, random candies will be generated. 

**Full Documentation**: https://docs.google.com/document/d/14Sa5gidgGSbhlf87K5KDiDqQwpsWG7MyiybDuFpHrM4/edit?usp=sharing

## Development Log ##

* **5/24**
  *Together: We created our repo, worked on creating our prototype, and discussed what elements of the game we wanted to include. We also created a basic UML diagram that connected our classes and methods. We set goals for our MVP and nice-to-have features for our final version.

* **5/25** 
  * **Steven**: I created the group discussion, created template classes and uploaded them to our repo. 
  * **Ava**: I joined the group discussion on rocketchat and pulled all of the class templates from our repo during class. 
  * **Together**: We discussed how we should specifically implement the Candy, Blocker, and Button classes. We realized that a nice use of OOP would be to make each level object dictated by a .txt file representing the level. This would make it easy for us to design levels since we would just edit a .txt file, and this also opens up the room for custom levels.

* **5/26** 
 * **Steven**: I implemented the Blocker class and Icing subclass, and tested displaying its icon from an image file in the Processing project data folder.
 * **Ava**: I created text files for Levels 1 and 2 with information about the initial positions of candies and letters representing the different colors. I also implemented the Candy class in a similar faction to the Blocker class and tested displaying various colors, which all worked.

* **5/27**
 * **Steven**: I created the mapTesting branch and worked on implementing the level class. To read in our level .txt file, I first tried using Java’s built in Scanner, but I realized that this meant I would need to encapsulate our main in a try-catch block. I did some research and discovered that I could also use Processing’s readString() function, and started working on scanning through that process.
 * **Ava**: I created the buttonDev branch and worked on creating our home screen with the play button and finding the right dimensions for our screen. After that, I added the image of the levels screen as well and started working on implementing the Button class, which connects the different screens.
 * **Together**: We briefly discussed how we could use git branching to divide our work and organize it in a fashionable manner.

* 5/30
 * **Steven**: N/A
 * **Ava**: I created the text files for levels 3 and 4, which included information about the candy placement and also information about the number of rows, columns, and the limited number of moves. 

* 5/31
 * **Steven**: First, I reformatted the class hierarchy of the game elements by adding the parent abstract class Element. Candy and Blockers now extend from this class, which removes the repeated constructor scheme for loading the image icon. I also finished the constructor of the level class using loadStrings and String delimiters. I was able to successfully display each Element object within the map 2D ArrayList of the level and also accounted for empty squares.
