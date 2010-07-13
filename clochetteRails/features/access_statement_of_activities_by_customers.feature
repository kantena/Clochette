Feature: Avoir acces au releve mensuel d'activites par clients
  En tant qu'Angelique 
  Je dois connaitre le nombre de jours a facturer au client 
  Je dois avoir acces aux informations du mois courant
  je dois egalement avoir acces aux informations concernant le 25 du mois precedent
  
  Idees de developpement:
  
@wip
Scenario: Affichage d'une liste de clients
  Given Je ne suis pas encore connecte a l'application
  When Je lance la page ''facturation_clients"
  Then Je dois avoir resume la liste des clients de Kantena
  
