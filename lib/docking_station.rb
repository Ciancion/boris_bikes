class DockingStation
  attr_reader :bikes, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
   raise 'There are no working bikes' if(empty? || get_working_bike.nil?)
   @bikes.delete(get_working_bike) #when a bike is released, we have to delete that from @bikes array
  end

  def broken_bikes
    @bikes.select { |bike| bike.broken }
  end

  def get_working_bike
    working_bikes = @bikes.select{|bike| bike.working?}
    return nil if working_bikes.empty?
    working_bikes[0]
  end

  def dock(bike)
    raise 'All bikes are docked' if full?
    @bikes.push(bike)
  end

  private

  def full?
    return true if @bikes.length >= @capacity
    false
  end

  def empty?
    return true if @bikes.empty?
    false
  end


end
