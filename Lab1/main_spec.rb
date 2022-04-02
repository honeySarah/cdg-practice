require 'rspec'
require './Lab1/main.rb'

RSpec.describe "Main" do
 it "#greeting with age>18" do
  allow_any_instance_of(Kernel).to receive(:gets).and_return('Валя', 'Паньков', 25)

  expect(greeting).to eq("Привет, Валя Паньков. Самое время заняться делом!")
 end

  it "#greeting with age<18" do
  allow_any_instance_of(Kernel).to receive(:gets).and_return('Андрей', 'Климов', 16)

  expect(greeting).to eq("Привет, Андрей Климов. Тебе меньше 18, но научиться программировать никогда не поздно!")
 end

  it "#greeting with wrong sintax" do
  allow_any_instance_of(Kernel).to receive(:gets).and_return('Валя', 'Паньков', 'двадцать')

  expect(greeting).to eq("error")
 end
end

RSpec.describe "Main" do
 it "#foobar without numb eq 20" do
  allow_any_instance_of(Kernel).to receive(:gets).and_return(15, 5)

  expect(foobar).to eq("20")
 end

  it "#foobar with numb eq 20" do
  allow_any_instance_of(Kernel).to receive(:gets).and_return(20, 106)

  expect(foobar).to eq("106")
 end
end