require 'rspec'
require_relative 'CashMachine'

BALANCE = 'Lab4/balance.txt'

RSpec.describe CashMachine do
  before {
    File.write(BALANCE, 1000.0)
  }

  it "#get_balance" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('b', 'q')

    expect(subject.init)
    expect(subject.get_balance).to eq(1000)
  end

  it "#deposit" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('d', '100', 'q')

    expect(subject.init)
    expect(File.read(BALANCE)).to eq('1100.0')
  end

  it "#deposit, incorrect count (not number)" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('d', 'String', 'q')

    expect(subject.init)
    expect(File.read(BALANCE)).to eq('1000.0')
  end

  it "#deposit, incorrect count (< 0)" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('d', '-100', 'q')

    expect(subject.init)
    expect(File.read(BALANCE)).to eq('1000.0')
  end

  it "#withdraw" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('w', '100', 'q')

    expect(subject.init)
    expect(File.read(BALANCE)).to eq('900.0')
  end

  it "#withdraw, incorrect count (not number)" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('w', 'String', 'q')

    expect(subject.init)
    expect(File.read(BALANCE)).to eq('1000.0')
  end

  it "#withdraw, incorrect count (< 0)" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('w', '-100', 'q')

    expect(subject.init)
    expect(File.read(BALANCE)).to eq('1000.0')
  end

  it "#withdraw, incorrect count (> balance)" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('w', '1100', 'q')

    expect(subject.init)
    expect(File.read(BALANCE)).to eq('1000.0')
  end
end