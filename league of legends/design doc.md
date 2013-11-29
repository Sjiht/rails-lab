League of Legends


====================


Design Document

---------------------

Patrick de Koning
Thijs van der Velden

### Mockups

## Home (search & login)
![Alt text](http://images2.fanpop.com/image/photos/9500000/sdfasdf-michael-jackson-9587475-600-300.jpg)\

## Game information

Mobile:\
![Alt text](/doc/img/mockup_mobile_2.png)\
\
Desktop:\
![Alt text](/doc/img/mockup_normal_2.png)\
\
## Jungle Timer\
![Alt text](/doc/img/mockup_mobile_3.png)\
\
## Models, views and controllers\
\
Controllers\
Home-controller\
GetSummonerData($summonerName)\
\
Data-controller\

RecentGames($summonerID)\

Runepage($summonerID)\

ActiveGameInfo($summonerID)\

Masteries($summonerID)\

Honor($summonerID\

Inlog-controller\

Login($emailAdress, $password)\
\
Registratie-controller\
Save($summonerName, $emailAdress, $password)\
\
Jungle-controler\
\
\
\
### Models\
Account-model\
ChampionData-model\
\
### Views\
Home\
Game\
Registreren\
Jungle Timers\
\
\
\
### Database fields\
\
Tabel \'91accounts\'92\
- id\
- summonerName STRING\
- emailAddress STRING\
- password STRING\
\
Tabel \'91championData\'92\
- id\
- championID INT\
- championName STRING\
}
