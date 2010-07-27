# language: fr
Fonctionnalité: Accès au nombre d'heures à facturer par clients le 25 du mois
    Je souhaite tous les 25 de chaque mois connaitre le nombre de jours à facturer à un client


  Scénario: Plusieurs developpeur peuvent travailler pour le même client
    Soit Nicolas ayant déclarer 3 jours de travail pour le client "Cour des Comptes"
    Lorsque l'on va sur la page d'acceuil
    Alors on obtient pour le client "Cour des Comptes" 3 jours à facturer

  Scénario: un développeur rentre son relevé de travail pour un client à différentes périodes (mois/année)
    Soit Hector ayant déclarer 10 jours de travail pour le client "Cour des Comptes" pour la date courant
    Lorsque l'on va sur la page d'acceuil
    Alors on obtient pour le client "Cour des Comptes" 10 jours à facturer pour la date courante