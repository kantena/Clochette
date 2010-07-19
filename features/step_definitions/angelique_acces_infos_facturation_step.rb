
# --- scénario : 1 ---

Soit /^Angélique qui se connecte sur sa page d'acceuil$/ do
  visit 'pages/main_angelique'
end

Soit /^qu'un "([^"]*)" a rentré (\d+) pour le client: "([^"]*)"$/ do \
    |developpeur, nb_jours_facturation, client|
  enregistrement = TravailDeveloppeur.new(
    :client => client,
    :nom_developpeur => developpeur,
    :nb_jours_travail => nb_jours_facturation,
    :mois => 'juillet',
    :annee => 2010
  ) 
end

Lorsque /^Angélique demande la fonctionnalité "([^"]*)"$/ do |link_path|
  click_link link_path
end

Alors /^Angélique obtient les informations du (\d+) pour le "([^"]*)" correspondant$/ do \
    |nb_jours_travail, nom_client|
  assert_contain nb_jours_travail
  assert_contain nom_client
end

