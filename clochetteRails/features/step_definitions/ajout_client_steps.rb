Soit /^l'ouverture de la page "([^"]*)" de l'application$/ do |new_client_path|
  visit new_client_path
end
Soit /^que je rentre Vinci dans le premier champ$/ do
  fill_in "client[nom]", :with => "Vinci"
end
Soit /^que je rentre (\d+) dans le second champ$/ do |nb_jours|
  fill_in "client[jours_a_facturer_mois_courant]", :with => nb_jours
end
Lorsque /^je tape sur la touche "([^"]*)"$/ do |bouton|
  click_button bouton
end

Soit /^que je rentre Apple dans le premier champ$/ do
  fill_in "client[nom]", :with => "Apple"
end

Alors /^je retrouve Vinci dans la nouvelle page et (\d+)$/ do |nb_jours|
  assert_contain ("Vinci")
  assert_contain (nb_jours)
end

Alors /^je retrouve Apple dans la nouvelle page et (\d+)$/ do |nb_jours|
  assert_contain ("Apple")
  assert_contain (nb_jours)
end





