
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
  r.validation_state false
end

Factory.define :vacation do |v|
  v.user {|a| a.association(:kantenien)}
  v.vacation_days 0
  v.month Date.today.month
  v.year Date.today.year
end
