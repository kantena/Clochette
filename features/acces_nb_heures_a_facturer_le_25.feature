# language: fr
Fonctionnalité: Accès au nombre d'heures à facturer par clients le 25 du mois
    Je souhaite tous les 25 de chaque mois connaitre le nombre de jours à facturer à un client

 
  Plan du Scénario: On peut visualiser le nombre de jours travaillés pour chaque clients
    Soit un "<developpeur>" qui a travaillé <nb_jours_de_travail> pour un "<client>"
    Lorsque l'on va sur la page d'acceuil
    Alors on obtient pour le client "<client>" <nb_jours_de_travail> jours à facturer
   
    Exemples:
        | developpeur |   client             | nb_jours_de_travail |
        |  nicolas    |  Cour des comptes    |       15            |
        |  damien     |  Vinci               |       10            |
        |  nicolas    |  Clochette           |       3             |
        |  philippe   |  Vinci               |       22            |
     

@wip
  Scénario: Plusieurs developpeur peuvent travailler pour le même client
    Soit Nicolas ayant déclarer 3 jours de travail pour le client "Cour des Comptes"
    Et Philippe ayant déclarer 3 jours de travail pour le client "Cour des Comptes"
    Lorsque l'on va sur la page d'acceuil
    Alors on obtient pour le client "Cour des Comptes" 6 jours à facturer