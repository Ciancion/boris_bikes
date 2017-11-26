require 'van'
require 'garage'


describe Van do
  let (:docking_station) {double (:docking_station)}
  let (:bike) {double (:bike)}

  it { is_expected.to respond_to(:collect) }
end

describe Van do
  it "Collect broken bike" do
    bike = double(:bike, working?: false)

    station = DockingStation.new
    station.dock(bike)
    expect(subject.collect(bike)).to match_array(subject.collect(bike)) #????????????????
  end
end

describe Garage do
  let (:docking_station) {double (:docking_station)}
  let (:bike) {double (:bike)}
  let (:van) {double (:van)}

  it "Deliver broken bikes to garage" do
    van_collect = double(:van, collect: bike )

    expect(subject.store(van_collect)).to be true

  end
end
