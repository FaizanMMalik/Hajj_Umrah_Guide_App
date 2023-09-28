Welcome to the GitHub repository for my final year project in pursuit of my BSIT degree. This Flutter application, "Hajj And Umrah Guide (Offline Maps)," is a comprehensive tool designed to enhance the experience of Hajj and Umrah pilgrims. This app not only provides offline maps powered by custom tiles but also incorporates a group creation feature, enabling users to send SMS invitations to fellow members. The app intelligently analyzes received SMS messages to perform database operations, creating a seamless and efficient communication network. With a combination of real-time messaging and offline map functionality, this project showcases my skills in mobile app development and database management, serving as a valuable resource for pilgrims during their spiritual journey.

Additionally, this versatile application can be equally beneficial for travelers, offering valuable features for navigation, communication, and information sharing. Feel free to contribute to this project and help make it even better. Your contributions and ideas are highly encouraged, and together, we can continue to improve this application to benefit both pilgrims and travelers alike.

Feel free to contribute to this project and help make it even better. Your contributions and ideas are highly encouraged, and together, we can continue to improve this application to benefit the pilgrim community.

Getting Started: 
1. Clone the repo
2. be sure to match the sdk version by looking in .yaml file
3. type "flutter pub get" in terminal
4. Add a folder named tiles and in it, put all the relevant tiles for using maps of specific areas


Oversight of the Project Implemented so far..

Support :

1.Local db crud operations(group management) operational
2. DB Crud operations operational for the application in another device via SMS.
3.SMS sending and receiving operational
4.Succesful displaying of a gcc tile (Offline Maps).
5. GUIDE completed
6. Admin and Member Authentication operational. 

Limitations :

1. Although offline map is displayed but there's no way for adding layers, live location, geofences and other animations in a tile that is independent of an Internet connection. 
2. Here we are assuming that the index/ id(AI and primary key in Groups table)  is the same. If it isn't the same then contacts can be added in different groups making a mess.

