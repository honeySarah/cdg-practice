require 'rspec'
require './Lab2/main.rb'

RSpec.describe "Laboratory Work 2" do

  it "#sample word have no 'CS' in the end" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("Listen", '2')

    expect(sample).to eq("netsiL")
  end

  it "#sample, word have 'CS' in the end" do
  allow_any_instance_of(Kernel).to receive(:gets).and_return("Hello cs", '2')
  
  expect(sample).to eq(4)
  end

  it "#sample with incorrect number" do
  allow_any_instance_of(Kernel).to receive(:gets).and_return("Listen")
  
  expect(sample).to eq('error')
  end

  it "#addPokemonToArray with incorrect number" do
  allow_any_instance_of(Kernel).to receive(:gets).and_return("Blah")
  
  expect(addPokemonToArray).to eq('error')
  end

  it "#addPokemonToArray" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('2', "Charmander", "Orange", "Hoothoot", "Brown")

    expect(addPokemonToArray).to eq([{name: "Charmander", color: "Orange"}, {name: "Hoothoot", color: "Brown"}])
  end
end