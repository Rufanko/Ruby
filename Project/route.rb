# frozen_string_literal: true

require_relative 'instance_counter.rb'
require_relative 'module_manufacturer.rb'

class Route
  include Valid
  include InstanceCounter
  attr_reader :stations

  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
    validate!
    register_instance
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
    @stations
  end

  protected

  def validate!
    raise 'first and last stations cant be the same ' if first_station == last_station
    raise 'wrong objects' unless first_station.instance_of?(Station) && last_station.instance_of?(Station)
  end
end
