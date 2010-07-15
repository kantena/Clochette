require File.dirname(__FILE__) + '/../test_helper'

class ClientTest < ActiveSupport::TestCase
  fixtures :clients
  
  test "un enregistrement ne peut etre valide vide" do
    client = Client.new
    assert client.invalid?
  end
  
  test "un enregistrement s'est correctement realise" do
    client = Client.new(:nom => 'Apple', :jours_a_facturer => 10)
    assert client.valid?
  end
    
  test "contraintes attribut nom" do
    #presence
    client = Client.new(:nom => '')
    assert client.invalid?
    #unicité
    client = Client.new( :nom => clients(:one).nom )
    assert !client.save
    assert_equal "has already been taken", client.errors[:nom]
  end
  
  test "contraintes attribut jours_a_facturer" do
   client = clients(:one)
   client.jours_a_facturer = -1
   assert client.invalid?
   client.jours_a_facturer = 32
   assert client.invalid?
   client.jours_a_facturer = 'A'
   assert client.invalid?
  end

end
