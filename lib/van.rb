require 'docking_station'

class Van
  def initialize
    @broken_bikes = []
  end

  def collect_from(docking_station)
    @broken_bikes.push(docking_station.broken_bikes)
  end

  def deliver_to(garage)
    garage.broken_bikes.push(@broken_bikes)
  end
end
