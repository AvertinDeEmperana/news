# news

A news app made with flutter using newsapi.org endpoints. This app is a non profit project ;). 
  

## App Screenshots

<img width="930" alt="frame1" src="https://user-images.githubusercontent.com/29286513/155232878-af23572c-e0cb-409a-a141-fbfca8e56fed.PNG">
<img width="925" alt="frame2" src="https://user-images.githubusercontent.com/29286513/155233062-6635917a-0d83-4cdf-a6c2-f55e063f20a6.PNG">
<img width="423" alt="frame3" src="https://user-images.githubusercontent.com/29286513/155233117-64bd7047-8a8b-4039-84cf-df99836687e5.PNG">

## Usages

* Get recents news
* Search for news and filter articles by category, languages, country or specific word
* Save articles on local storage and consult them when the mobile device is offline
* Consult an article page (original site web)
* Share articles

## Technologie 

* Flutter   
* Dart
* Android Studio for developing
* Invision Studio for mockups

## Design patter: MVVM

The key benefit is allowing true separation between the View and Model and the efficiency that you gain from having that. What it means in real terms is that when your model needs to change, it can be changed easily without the view needing to and vice-versa.

## Interesting packages used for this app

* dio: An http client for and api requests
* shimmer: for loading animation before fetching data
* auto_route: used to generate routes for navigation
* provider: for the state managment
* share_plus: to share articles
* objectbox: for data persistence

## Installation

To execute this app, you'll need an api key. You can get an api key for free if you register on newsapi.org. 

The first step is to get the last version of flutter 2.10.2

Then you can clone the project and move into the root directory:

<img width="448" alt="clone" src="https://user-images.githubusercontent.com/29286513/155226069-97bfad73-824a-4ad5-ad87-c702b0709385.PNG">

After cloning the project, you have to get dependencies. So you will run:

<img width="504" alt="pubget" src="https://user-images.githubusercontent.com/29286513/155226258-123b38b0-5bcb-4462-b4f0-d0b0e01dd5d6.PNG">

To run the app, you have to provide your api key, else the newsapi server won't allow you to retrieve data

Run the command below to execute the app:

<img width="453" alt="run" src="https://user-images.githubusercontent.com/29286513/155226529-d047937a-06a4-4a49-bd41-1955c45c8b72.PNG">



