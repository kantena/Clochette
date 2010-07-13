
#debuts développement des critères d'acceptances
Given /^un client qui possede le nom "([^"]*)"$/ do |arg1|
  @client=arg1
end

When /^je lance la page "([^"]*)"$/ do |arg1|
  infos_facturation_path="pages/" + arg1
  visit infos_facturation_path
end

Then /^l'application me retourne "([^"]*)", nom du client$/ do |arg1|
  response.should contain(arg1)
end
