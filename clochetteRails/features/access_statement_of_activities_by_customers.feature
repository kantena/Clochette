Feature: Avoir acces aux informations sur le nombre d'heures passees par clients pour controler les facturations
  En tant qu'Angelique 
  Afin de connaitre le nombre de jours a facturer a un client tous les 25 du mois
  Je dois avoir acces pour chaque client au nombre de journees de travail globalisees
  Je dois egalement avoir acces aux informations concernant le 25 du mois precedent
  
  Idees de developpement:
  
@wip
Scenario: Je recupere les informations sur un client
  Given un client qui possede le nom "Apple"
  When je lance la page "infos_facturation"
  Then l'application me retourne "Apple", nom du client 
  
