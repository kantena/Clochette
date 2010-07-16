Soit /^j'ai enregistré mes données Vinci et (\d+) dans la page "([^"]*)"$/ do |nb_jours, path|
  visit path
  fill_in "client[nom]", :with => "Vinci"
  fill_in "client[jours_a_facturer_mois_courant]", :with => nb_jours
  click_button 'Create'
end

Soit /^j'ai enregistré mes données Apple et (\d+) dans la page "([^"]*)"$/ do |nb_jours, path|
  visit path
  fill_in "client[nom]", :with => "Apple"
  fill_in "client[jours_a_facturer_mois_courant]", :with => nb_jours
  click_button 'Create'
end

Lorsque /^j'ouvre la page "([^"]*)" de l'application$/ do |infos_facturation_path|
  visit infos_facturation_path
end

Alors /^je dois voir les informations Vinci et (\d+) dans ma page$/ do |info_mois_courant|
  assert_contain "Vinci"
  assert_contain info_mois_courant
end

Alors /^je dois voir les informations Apple et (\d+) dans ma page$/ do |info_mois_courant|
	assert_contain "Apple"
  assert_contain info_mois_courant
end

