# language: fr
Fonctionnalité: Accès au nombre d'heures à facturer par clients le 25 du mois
    En tant qu'angélique
    Je souhaite tous les 25 de chaque mois connaitre le nombre de jours à facturer à un client
    Chaque développeur doit rentrer les informations concernant son relevé d'activités avant le 25 de chaque mois
    Si un développeur n'a pas validé son relevé d'activités, un message de notification doit être présenté à angélique

@wip
Plan du Scénario: Chaque client n'a qu'un développeur travaillant pour lui
    Soit Angélique qui se connecte sur sa page d'acceuil
    Et qu'un "<developpeur>" a rentré <nb_jours_travail> pour le client: "<client>"
    Lorsque Angélique demande la fonctionnalité "gestion des facturations"
    Alors Angélique obtient les informations du <nb_jours_travail> pour le "<client>" correspondant

    Exemples:
        | developpeur |   client             | nb_jours_travail |
        |  nicolas    |  Cour des comptes    |       15         |
        |  damien     |  Vinci               |       10         |
        |  nicolas    |  Clochette           |       3          |


Plan du Scénario: Un client peut avoir plusieurs développeurs travaillants pour lui
    Soit Angélique qui se connecte sur sa page d'acceuil
    Et qu'un "<developpeur>" a rentré <nb_jours_travail> pour le client: "<client>"
    Lorsque Angélique demande la fonctionnalité "gestion des facturations"
    Alors Angélique obtient "13" jours de travail pour le client "Vinci"
    Et Angélique obtient "15" jours de travail pour le client "Cour des comptes"

    Exemples:
        | developpeur |   client            | nb_jours_travail |
        |  nicolas    |  Cour des comptes   |       15         |
        |  damien     |  Vinci              |       10         |
        |  nicolas    |  Vinci              |       3          |