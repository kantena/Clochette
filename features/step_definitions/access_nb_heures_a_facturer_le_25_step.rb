Soit /^Nicolas ayant déclarer (\d+) jours de travail pour le client "([^"]*)"$/ do |nb_jours_travail, client|
  build_releve_activite 'Nicolas', nb_jours_travail, client
end

Soit /^Philippe ayant déclarer (\d+) jours de travail pour le client "([^"]*)"$/ do |nb_jours_travail, client|
  build_releve_activite 'Philippe', nb_jours_travail, client
end

Lorsque /^l'on va sur la page d'acceuil$/ do
  visit "/"
end

Alors /^on obtient pour le client "([^"]*)" (\d+) jours à facturer$/ do |nom_client, nb_jours_a_facturer|
  response.should have_tag("td", :id => "customer_name", :content => nom_client)
  response.should have_tag("td", :id => "invoicing_days", :content => nb_jours_a_facturer)
end

def build_releve_activite dev, jours, client
  c = Factory(:customer, :name => client) if Customer.find_by_name(client) == nil
  d = Factory(:kantenien, :name => dev) if Developper.find_by_name(dev) == nil
  Factory(:activity_note, :customer => c, :developper => d, :working_days => jours )
end