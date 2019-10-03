# frozen_string_literal: true

require_relative 'module_manufacturer.rb'
require_relative 'instance_counter.rb'
class Train
  include Manufacturer
  include InstanceCounter
  attr_accessor :list_of_vagons, :type, :number, :speed
  @@all_trains = Hash.new
  NUMBER_FORMAT = /^([a-z]|[1-9]){3}-?([a-z]|[1-9]){2}$/.freeze # /\w{3}-?\w{2}/
  def initialize(type, number)
    @type = type
    @number = number
    @list_of_vagons = []
    @speed = 0
    @@all_trains[number] = self
    register_instance
    validate!
  end

  def validate?
    validate!
    true
  rescue RuntimeError
    false
  end

  def self.find(num)
    @@all_trains[num]
  end

  def speed_up(speed)
    @speed += speed
  end

  def decrease_speed(value)
    @speed -= value if @speed >= value
  end

  def take_vagon(vagon)
    @list_of_vagons.push(vagon) if speed == 0
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

  def validate!
    raise "type can't be nil" if type.nil?
    raise "number can't be nil" if number.nil?
    raise 'number has invalid format' if number !~ NUMBER_FORMAT
  end
end
