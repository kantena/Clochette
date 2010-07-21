
Factory.define :kantenien, :class => Developper do |k|
  k.name 'name'
end

Factory.define :customer do |c|
  c.name "name"
end

Factory.define :activity_note do |r|
  r.customer {|a| a.association(:customer)}
  r.developper {|a| a.association(:kantenien)}
  r.working_days 0
end