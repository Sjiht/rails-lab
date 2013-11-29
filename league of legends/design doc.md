League of Legends


====================


Design Document

---------------------

Patrick de Koning
Thijs van der Velden

## Mockups

### Home (search & login)
![Alt text](http://download.pdkwebs.nl/download/images/IK/MPROG/mockup_mobile_1.png)

### Game information

Mobile:


![Alt text](http://download.pdkwebs.nl/download/images/IK/MPROG/mockup_mobile_2.png)

Desktop:


![Alt text](http://download.pdkwebs.nl/download/images/IK/MPROG/mockup_normal_2.png)

### Jungle Timer
![Alt text](http://download.pdkwebs.nl/download/images/IK/MPROG/mockup_normal_3.png)

### Models, views and controllers

Controllers
Home-controller

* GetSummonerData($summonerName)

Data-controller

* RecentGames($summonerID)
* Runepage($summonerID)
* ActiveGameInfo($summonerID)
* Masteries($summonerID)
* Honor($summonerID

Inlog-controller

* Login($emailAdress, $password)

Registratie-controller
* Save($summonerName, $emailAdress, $password)\

Jungle-controller


## Models

* Account-model
* ChampionData-model\

## Views
Home
Game
Registreren
Jungle Timers

## Database fields

Tabel accounts
- id
- summonerName STRING
- emailAddress STRING
- password STRING


Tabel championData
- id
- championID INT
- championName STRING

