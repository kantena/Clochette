# coding: utf-8
require 'spec_helper'

describe User do
  it "verifie si l'utilisateur est un utisateur est un developpeur" do
    user = Factory(:kantenien, :name =>'nfe', :function => 'developper')
    assert_equal true, user.is_developper?
  end

  it "verifie si l'utilisateur est un utisateur n'est pas un developpeur" do
    user = Factory(:kantenien, :name =>'angélique', :function => 'faery')
    assert_equal false, user.is_developper?
  end
end
