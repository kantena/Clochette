# language: fr
Fonctionnalité: en tant qu'angélique je dois pouvoir voir si un relevé est validé ou non

Scénario: En tant qu'angélique, je dois pouvoir voir être informé que l'ensemble des relevés est validé pour un client
    Soit 'nicolas' ayant validé à "true" ses relevés d'activités pour le client "Cour des comptes"
    Et 'damien' ayant également validé à "true" ses relevés d'activités pour le même client "Cour des comptes"
    Lorsque angélique se connecte sur la page d'acceuil
    Alors elle doit être informé de l'état de validation générale "Oui" des relevés d'activités pour le client "Cour des comptes"

Scénario: En tant qu'angélique, je dois pouvoir voir être informé que l'ensemble des relevés n'est pas validé pour un client
    Soit 'nicolas' ayant validé à "true" ses relevés d'activités pour le client "Cour des comptes"
    Et 'damien' ayant validé à "false" ses relevés d'activités pour le même client "Cour des comptes"
    Lorsque angélique se connecte sur la page d'acceuil
    Alors elle doit être informé de l'état de validation générale "Non" des relevés d'activités pour le client "Cour des comptes"

@wip
Scénario: En tant qu'équipier je dois pouvoir valider un relevé d'activités
    Soit un équipier qui se connecte sur sa liste de relevés d'activités
    Lorsqu'il valide la checkbox "Valider"
    Alors l'état interne du relevé d'activité doit être validé
