# frozen_string_literal: true

class Train
  attr_accessor :list_of_vagons, :type, :number, :speed

  def initialize(type, number)
    @type = type
    @number = number
    @list_of_vagons = []
    @speed = 0
  end

  def speed_up(speed)
    @speed += speed
  end

  def decrease_speed(value)
    @speed -= value if @speed >= value
  end

  def take_vagon(vagon)
    if speed == 0 
      @list_of_vagons.push(vagon) 
    end
  end

  def delete_vagon(vagon)
    @list_of_vagons.delete(vagon)
  end

  def route_add(route)
    @trainroute = route
    @current_station_index = 0
    current_station.take_train(self)
    @arrlegth = @trainroute.stations.length - 1
  end

  def current_station
    @trainroute.stations[@current_station_index]
  end

  def next_station
    if @current_station_index < @arrlegth
      @trainroute.stations[@current_station_index + 1]
    end
  end

  def previous_station
    if @current_station_index > 0
      @trainroute.stations[@current_station_index - 1]
    end
  end

  def move_fwd
    if next_station
      @current_station_index += 1
      previous_station.delete_train(self)
      current_station.take_train(self)
    end
  end

  def move_back
    if previous_station
      @current_station_index -= 1
      next_station.delete_train(self)
      current_station.take_train(self)

    end
  end
end
