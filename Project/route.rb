# frozen_string_literal: true

class Route
  attr_reader :stations 

  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
  end

  def add_st(n = 1, station)
    @stations.insert(n, station)
  end

  def delete_st(station)
    @stations.delete(station)
  end

  def first_station
    @stations[0]
  end

  def last_station
    @stations[-1]
  end

  def show_stations_names
    puts @stations
  end
end
