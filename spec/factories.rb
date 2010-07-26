
Factory.sequence :name do |i|
  "Valentin_#{i}"
end

Factory.define :kantenien, :class => User do |k|
  k.name { Factory.next(:name) }
end

Factory.define :customer do |c|
  c.name { Factory.next(:name) }
end

Factory.define :activity_note do |r|
  r.customer {|a| a.association(:customer)}
  r.user {|a| a.association(:kantenien)}
  r.working_days 0
  r.month 10
  r.year 2010
end

Factory.define :vacation_note do |v|
  v.kantenien {|a| a.association(:kantenien)}
  v.day_beginning_vacation 0
  v.day_end_vacation 0
  v.month_beginning_vacation 0
  v.month_end_vacation 0
  v.year_beginning_vacation 2010
  v.year_end_vacation 210
  v.nb_jours_conges 0
end