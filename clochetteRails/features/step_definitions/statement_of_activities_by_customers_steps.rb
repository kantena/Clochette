infos_facturation_path='pages/facturation_clients'

#debuts développement des critères d'acceptances
Given /^Je ne suis pas encore connecte a l'application$/ do
end

When /^Je lance la page ''facturation_clients"$/ do
  visit infos_facturation_path
end

Then /^Je dois avoir resume la liste des clients de Kantena$/ do
  pending # express the regexp above with the code you wish you had
end
