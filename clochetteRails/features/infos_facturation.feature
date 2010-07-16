# language: fr
Fonctionnalité: affichage des informations relatives à la facturation des clients

	Plan du Scénario: Affichage des informations de base de l'application 
		Soit  j'ai enregistré mes données <nom> et <jours_facturation_mois_courant> dans la page "/clients/new"
		Lorsque j'ouvre la page "pages/infos_facturation" de l'application
		Alors je dois voir les informations <nom> et <jours_facturation_mois_courant> dans ma page

	Exemples:
	| nom	| jours_facturation_mois_courant	|
	| Vinci	|            		 10        			|
	| Apple	|             		 15             	        |