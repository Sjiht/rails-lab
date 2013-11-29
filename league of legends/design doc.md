{\rtf1\ansi\ansicpg1252\cocoartf1138\cocoasubrtf510
{\fonttbl\f0\fswiss\fcharset0 ArialMT;}
{\colortbl;\red255\green255\blue255;\red26\green26\blue26;\red255\green255\blue255;}
\paperw11900\paperh16840\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\deftab720
\pard\pardeftab720

\f0\fs26 \cf2 \cb3 League of Legends\
====================\
\
Design Document\
---------------------\
\
Patrick de Koning\
Thijs van der Velden\
\
\
### Mockups\
\
## Home (search & login)\
![Alt text](/doc/img/mockup_mobile_1.png)\
\
## Game information\
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