# frozen_string_literal: true

require_relative 'module_manufacturer.rb'
require_relative 'instance_counter.rb'
class Train
  include Valid
  include Manufacturer
  include InstanceCounter
  attr_accessor :list_of_vagons, :type, :number, :speed, :vagoncounter
  @@all_trains = {}
  NUMBER_FORMAT = /^([a-z]|[1-9]){3}-?([a-z]|[1-9]){2}$/.freeze # /\w{3}-?\w{2}/
  def initialize(type, number)
    @type = type
    @number = number
    validate!
    @list_of_vagons = []
    @speed = 0
    @@all_trains[number] = self
    register_instance
    @vagoncounter = 0
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
    @vagoncounter += 1
  end

  def delete_vagon(vagon)
    @list_of_vagons.delete(vagon)
    @vagoncounter -= 1
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

  def enumerate
    list_of_vagons.each { |vagon| yield(vagon) } if block_given?
  end

  protected

  def validate!
    raise "type can't be nil" if type.nil?
    raise "number can't be nil" if number.nil?
    raise 'number has invalid format' if number !~ NUMBER_FORMAT
  end
end
