Given /^Je ne suis pas encore connecte a l'application$/ do
end

When /^Je lance la page ''facturation_clients"$/ do
  visit facturation_clients_path
end

Then /^Je dois etre connecte a la page "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

