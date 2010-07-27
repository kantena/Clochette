#language: fr
Fonctionnalité: On souhaite gérer les jours de congés des kanténiens
    Angélique souhaite être informé du nb de congés par mois d'un kanténien.
    Un kanténien peut avoir la fonctionnalité de déclarer lui même son nombre de congés
    On prend par défaut un nombre de jours de congés déclarés
    Le but final étant de récupèrer ces informations depuis l'agenda Google du kanténien

@wip
Scénario: un kanténien déclare un nombre de jours de congés pour le mois courant, angélique doit en être informé sur sa page d'acceuil
    Soit un kanténien "hector" qui a déclaré 3 jours de congés pour le mois courant
    Lorsque angélique se connecte sur la page d'acceuil "home"
    Alors elle obtient le nombre de jours de congés relatif au kanténien "hector" égal à 3

Scénario: un kanténien déclare 2 périodes de congés pour le mois courant, angélique doit en être informé sur sa page d'acceuil
    Soit un kanténien "hector" qui a déclaré 3 jours et 6 jours de congés pour le mois courant
    Lorsque angélique se connecte sur la page d'acceuil "home"
    Alors elle obtient le nombre de jours de congés relatif au kanténien "hector" égal à 9

Scénario: un kanténien doit pouvoir éditer son nombre de jours de congés et les valider, l'information se répercute pour angélique
    Soit un kanténien "hector" qui a déclaré 5 jours de congés pour le mois courant
    Lorsqu'il choisit d'éditer son nombre de jours de congés à 6 depuis son espace de travail
    Alors la modification à 6 jours de congés a été prise en compte 
    Et angélique obtient l'information que "hector" a déclaré 6 jours de congés sur sa page principale

