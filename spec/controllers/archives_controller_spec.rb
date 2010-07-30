# coding: utf-8
require 'spec_helper'

describe ArchivesController do
  integrate_views

  it "affiche la page index" do
    get 'index'
    response.should be_success
  end

  it "affiche les archives du mois précédents" do
    past_month = 6
    nicolas = Factory(:kantenien, :name =>'nicolas')
    cdc = Factory(:customer, :name => 'Cour des comptes')
    Factory(:activity_note, :customer => cdc, :user => nicolas, :working_days => 1,
      :month => past_month, :year => Date.today.year, :validation_state => false)
    
    get 'index'
    response.should be_success
    assert response.body.include?("Juin"),
      "'Juin' n'apparait pas sur la page"
    assert response.body.include?("Client : Cour des comptes"),
      "Client : Cour des comptes n'apparait pas sur la page"
    assert response.body.include?("Jours facturés  : 1"),
      "'Jours facturés  : 1' n'apparait pas sur la page"
    assert response.body.include?("<td> nicolas</td>"),
      "'<td> nicolas</td>' n'apparait pas sur la page"
    
  end

  it "affiche les archives d'il y a trois mois" do
    past_month = 6
    nicolas = Factory(:kantenien, :name =>'nicolas')
    cdc = Factory(:customer, :name => 'Cour des comptes')
    Factory(:activity_note, :customer => cdc, :user => nicolas, :working_days => 1,
      :month => past_month, :year => Date.today.year, :validation_state => false)

    get 'show', :id => past_month - 2
    response.should be_success
    assert response.body.include?("Avril"),
      "'Avril' n'apparait pas sur la page"
  end

  it "affiche les archives d'il y a un an" do
    past_month = 6
    nicolas = Factory(:kantenien, :name =>'nicolas')
    cdc = Factory(:customer, :name => 'Cour des comptes')
    Factory(:activity_note, :customer => cdc, :user => nicolas, :working_days => 1,
      :month => past_month, :year => Date.today.year, :validation_state => false)

    get 'show', :id => past_month - 12
    response.should be_success
    assert response.body.include?("Décembre"),
      "'Décembre' n'apparait pas sur la page"
  end
end
  
