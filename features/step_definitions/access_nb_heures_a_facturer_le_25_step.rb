Soit /^Nicolas ayant déclarer (\d+) jours de travail pour le client "([^"]*)"$/ do |nb_jours_travail, client|
  act1 = build_releve_activite 'Nicolas', nb_jours_travail, client
  act2 = build_releve_activite 'Philippe', nb_jours_travail, client
  Factory(:customer, :activities => [act1, act2])
end

Soit /^Philippe ayant déclarer (\d+) jours de travail pour le client "([^"]*)"$/ do |nb_jours_travail, client|
 
end

Lorsque /^l'on va sur la page d'acceuil$/ do
  visit "/home"
end

Alors /^on obtient pour le client "([^"]*)" (\d+) jours à facturer$/ do |nom_client, nb_jours_a_facturer|
  #TODO : tests de contenu de balise avec webrat
  assert response.body.include?(nom_client)
  assert response.body.include?(nb_jours_a_facturer)
end


# scénario 2

Soit /^Hector ayant déclarer (\d+) jours de travail pour le client "([^"]*)" pour le (\d+) ème mois de l'année (\d+)$/ do |nb_jours_travail, nom_client, mois, annee|
  build_releve_activite 'Hector', nb_jours_travail, nom_client, mois, annee
end

Soit /^Hector ayant déclarer (\d+) jours de travail pour le client "([^"]*)" pour la date courant$/ do |nb_jours_travail, nom_client|
  build_releve_activite 'Hector', nb_jours_travail, nom_client, Date.today.month, Date.today.year
end

Alors /^on obtient pour le client "([^"]*)" (\d+) jours à facturer pour la date courante$/ do |nom_client, nb_jours_travail|
  #TODO : tests de contenu de balise avec webrat
  assert response.body.include?(nom_client)
  assert response.body.include?(nb_jours_travail)
end


def build_releve_activite dev, jours, client, mois=7, annee=2010
  customer = Factory(:customer, :name => client) unless Customer.find_by_name(client)
  developper = Factory(:kantenien, :name => dev) unless User.find_by_name(dev)
  Factory(:activity_note, :customer => customer, :user => developper, :working_days => jours ,:month => mois, :year => annee)
end