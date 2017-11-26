require 'docking_station'
require 'bike'

describe DockingStation do
  let (:bike) {double :bike}


  it { is_expected.to respond_to(:release_bike, :dock) }

  it "Default variable capacity" do
    station = DockingStation.new()
    expect(station.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it "Variable capacity" do
    station = DockingStation.new(40)
    expect(station.capacity).to eq 40
  end

  it "realease a bike and it's working" do
    bike = double(:bike, working?: true)
    subject.dock(bike)
    expect(subject.release_bike).to eq(bike)
    expect(bike.working?).to be(true)
  end

  it "returns a docked bike" do
    bike = double(:bike, working?: true)
    subject.dock(bike)
    expect(subject.release_bike).to eq(bike)
  end

  it "raise an error" do
    expect { subject.release_bike }.to raise_error("There are no working bikes")
  end

  it "raise error bike already docked" do
    subject.capacity.times{subject.dock(double(:bike))}
    expect { subject.dock(double(:bike)) }.to raise_error("All bikes are docked")
  end

  it "Broken bike" do
    bike = double(:bike, working?: false)
    expect(bike.working?).to be(false)
  end

  it "The bike is broken so it can not be released" do
    bike = double(:bike, working?: false)
    subject.dock(bike) #the bike is broken
    expect { subject.release_bike }.to raise_error("There are no working bikes")
  end

end
