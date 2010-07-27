# ---- scénario 1 ----

Soit /^'nicolas' ayant validé à "([^"]*)" ses relevés d'activités pour le client "([^"]*)"$/ do |etat_valide, nom_client|
  build_releve_activite nom_client, etat_valide, 'nicolas'
end

Soit /^'damien' ayant également validé à "([^"]*)" ses relevés d'activités pour le même client "([^"]*)"$/ do |etat_valide, nom_client|
  build_releve_activite nom_client, etat_valide, 'damien'
end

Lorsque /^angélique se connecte sur la page d'acceuil$/ do
  visit "/"
end

Alors /^elle doit être informé de l'état de validation générale "([^"]*)" des relevés d'activités pour le client "([^"]*)"$/ do |etat_validation, nom_client|
  assert response.body.include?(nom_client)
  assert response.body.include?(etat_validation)
end

# ---- scénario 2 ----
Soit /^'damien' ayant validé à "([^"]*)" ses relevés d'activités pour le même client "([^"]*)"$/ do |etat_valide, nom_client|
  build_releve_activite nom_client, etat_valide, 'damien'
end

# ---- scénario 3 ----

Soit /^un équipier qui se connecte sur sa liste de relevés d'activités$/ do
  pending # express the regexp above with the code you wish you had
end

Lorsqu /^il valide la checkbox "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Alors /^l'état interne du relevé d'activité doit être validé$/ do
  pending # express the regexp above with the code you wish you had
end


def build_releve_activite client, validation, dev, jours=10, mois=7, annee=2010
  customer = Factory(:customer, :name => client) unless Customer.find_by_name(client)
  developper = Factory(:kantenien, :name => dev) unless Developper.find_by_name(dev)
  Factory(:activity_note, :customer => customer, :developper => developper, :working_days => jours ,:month => mois, :year => annee, :validation_state => validation)
end