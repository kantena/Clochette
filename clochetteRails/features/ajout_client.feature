# language: fr
Fonctionnalité: Ajout d'un client dans la base de données en mode intéractif

Plan du Scénario: Ajout d'un seul client 
	Soit l'ouverture de la page "clients/new" de l'application
	Et que je rentre <nom> dans le premier champ
	Et que je rentre <jours_facturation_mois_courant> dans le second champ
	Lorsque je tape sur la touche "Create"
	Alors je retrouve <nom> dans la nouvelle page et <jours_facturation_mois_courant>

	Exemples:
	| nom	| jours_facturation_mois_courant	|
	| Vinci	|            		 10        			|
	| Apple	|             		 15             	        |