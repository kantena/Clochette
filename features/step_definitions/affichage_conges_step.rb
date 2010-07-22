Soit /^un consultant "([^"]*)" qui est en congé pendant "([^"]*)" jours le "([^"]*)"eme mois$/ do\
    |nom_consultant, total_jours_conges, mois|
  pending # express the regexp above with the code you wish you had
end




#Soit /^un consultant "([^"]*)" qui est en congé depuis le  "([^"]*)"\/"([^"]*)" pour "([^"]*)" jours de congés$/ do \
#
#  k = Factory(:kantenian, :name => nom_consultant)
#  Factory(:vacation_note, :kantenien => k, :day_beginning_vacation => jour_debut, :month_beginning_vacation => mois_debut)
#end

Lorsque /^je me connecte sur la page d'acceuil$/ do
  pending # express the regexp above with the code you wish you had
end

Alors /^je dois voir que "([^"]*)" est en congé pendant "([^"]*)" jours le "([^"]*)"eme mois$/ do |arg1, arg2, arg3|
  pending # express the regexp above with the code you wish you had
end