require 'bike'

describe Bike do
  it { is_expected.to respond_to(:functional)}

  it 'should initialize with working equals true' do
    expect(subject.functional).to be true
  end

  it 'should change value of functional' do
    subject.functional = false
    expect(subject.functional).to be false
  end


end
