
Factory.sequence :name do |i|
  "Valentin_#{i}"
end

Factory.define :kantenien, :class => Developper do |k|
  k.name { Factory.next(:name) }
end

Factory.define :customer do |c|
  c.name { Factory.next(:name) }
end

Factory.define :activity_note do |r|
  r.customer {|a| a.association(:customer)}
  r.developper {|a| a.association(:kantenien)}
  r.working_days 0
  r.month 10
  r.year 2010
end