require 'garage'


describe Garage do
  describe "receives bikes, fixes them and returns them to van" do
    describe "#fix" do
      it "takes, fixes and returns bike" do
        bike = double(:bike)
        allow(bike).to receive(:functional).and_return(true)
        allow(bike).to receive(:functional=).and_return(false)
        subject.fix(bike)
        expect(bike.functional).to eq(true)
      end
    end
  end
end
