# language: fr
Fonctionnalité: On souhaite afficher le nombre de jours de congés pour un consultant et un mois donné

@wip
    Scénario: un consultant a déclaré sa période de congés. Celle-ci tiens sur un unique mois, on ne précise que le nombre de jours
        Soit un consultant "nicolas" qui est en congé pendant "10" jours le "5"eme mois
        Lorsque je me connecte sur la page d'acceuil
        Alors je dois voir que "nicolas" est en congé pendant "5" jours le "5"eme mois
