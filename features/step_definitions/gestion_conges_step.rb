Soit /^un kanténien "([^"]*)" qui a déclaré (\d+) jours de congés pour le mois courant$/ do |nom_kantenien, nb_jours_conges|
  developpeur = Factory(:kantenien, :name => nom_kantenien)
  Factory(:vacation_note, :user => developpeur, :vacation_days => nb_jours_conges)
end

Lorsque /^angélique se connecte sur la page d'acceuil "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Alors /^elle obtient le nombre de jours de congés relatif au kanténien "([^"]*)" égal à (\d+)$/ do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end
