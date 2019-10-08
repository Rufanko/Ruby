# frozen_string_literal: true

require_relative 'train.rb'
require_relative 'station.rb'
require_relative 'route.rb'
require_relative 'passenger_train.rb'
require_relative 'passengervagon.rb'
require_relative 'cargovagon.rb'
require_relative 'cargo_train.rb'
require_relative 'main_menu.rb'
require_relative 'class_menu.rb'
require_relative 'instance_counter.rb'
require_relative 'module_manufacturer.rb'
class Menu
  attr_accessor :trains, :routes, :stationlist, :vagons
  def initialize
    @trains = []
    @routes = []
    @stationlist = []
    @vagons = []
    end

  def vagonlist
    putstrain
    i = gets.to_i
    puts @trains[i].list_of_vagons
    end

  def create_train
    puts 'Выберите тип поезда'
    puts '1.Пассажирский'
    puts '2.Грузовой'
    users_string = gets.chomp!
    case users_string
    when '1'
      begin
      create_pass_train
      puts 'Пассажирский поезд создан'
      rescue RuntimeError
        puts 'Введите корректный номер поезда'
        attempt ||= 0
        attempt += 1
        retry unless attempt > 2
    end
    when '2'
      begin
      create_cargo_train
      puts 'Грузовой поезд создан'
      rescue RuntimeError
        puts 'Введите корректный номер поезда'
        attempt ||= 0
        attempt += 1
        retry unless attempt > 2
    end
    end
    end

  def create_route
    putsstation
    i = gets.to_i
    puts'Выберите последнюю станцию (введите соответствующий индекс массива)'
    putsstation
    k = gets.to_i
    puts 'Введите название маршрута'
    routename = gets.chomp!
    @routes << Route.new(@stationlist[i], @stationlist[k])
    end

  def create_station
    puts 'Введите название станции'
    stationname = gets.chomp!
    @stationlist << Station.new(stationname)
    end

  def create_vagon
    puts 'Выберите тип вагона'
    puts '1.Пассажирский'
    puts '2.Грузовой'
    users_string = gets.chomp!

    case users_string
    when '1'
      puts 'Введите название экзмепляра класса'
      vagonname = gets.chomp!
      @vagons << vagonname = Passengervagon.new

    when '2'
      puts 'Введите название экзмепляра класса'
      vagonname = gets.chomp!
      @vagons << vagonname = Cargovagon.new
    end
    end

  def add_car
    putstrain
    i = gets.to_i
    puts 'Выберите вагон (введите соответствующий индекс массива)'
    j = -1
    @vagons.each { |x| puts "Введите #{j += 1}, чтобы выбрать вагон", x }
    k = gets.to_i
    if !@trains[i].nil?
      @trains[i].take_vagon(@vagons[k])
    else puts 'nil'
   end
    end

  def delete_car
    putstrain
    i = gets.to_i
    puts 'Выберите вагон (введите соответствующий индекс массива)'
    z = -1
    unless @trains[i].nil?
      @trains[i].list_of_vagons.each { |_x| puts "Введите #{z += 1}, чтобы выбрать вагон " }
      k = gets.to_i
      vagon = trains[i].list_of_vagons[k]
      @trains[i].delete_vagon(vagon)
    end
    end

  def delete_station
    putsroute
    i = gets.to_i
    z = -1
    @routes[i].stations.each { |x| puts "Введите #{z += 1}, чтобы выбрать станцию ", x.name }
    k = gets.to_i
    st = @routes[i].stations[k]
    @routes[i].delete_st(st) if !@routes.nil? && !st.nil?
    end

  def add_station
    putsstation
    k = gets.to_i
    i = gets.to_i
    @routes[i].add_st(@stationlist[k]) if !@routes.nil? && !@stationlist[k].nil?
    end

  def accelerate
    putstrain
    i = gets.to_i
    puts 'введите скорость'
    value = gets.to_i
    @trains[i]&.speed_up(value)
    end

  def slow_down
    putstrain
    i = gets.to_i
    puts 'Введите скорость'
    value = gets.to_i
    @trains[i]&.decrease_speed(value)
    end

  def add_route
    putstrain
    i = gets.to_i
    j = -1
    k = -1
    @routes.each do |_x|
      puts "Введите #{j += 1} чтобы выбрать маршрут"
      @routes[k += 1].stations.each { |y| puts y.name }
    end
    k = gets.to_i
    @trains[i].route_add(@routes[k]) if !@trains[i].nil? && !@routes[k].nil?
     end

  def move_forward
    putstrain
    i = gets.to_i
    @trains[i]&.move_fwd
    end

  def get_back
    putstrain
    i = gets.to_i
    @trains[i]&.move_back
    end

  def current_speed
    putstrain
    i = gets.to_i
    puts @trains[i].speed unless @trains[i].nil?
    end

  def curr_station
    putstrain
    i = gets.to_i
    puts @trains[i].current_station.name unless @trains[i].nil?
    end

  def traintype
    putstrain
    i = gets.to_i
    puts @trains[i].type unless @trains[i].nil?
    end

  def trainnumber
    putstrain
    i = gets.to_i
    puts @trains[i].number unless @trains[i].nil?
    end

  def list_of_trains
    putsstation
    i = gets.to_i
    unless @stationlist[i].nil?
      puts @stationlist[i].trainlist.each { |x| puts x.number }
    end
    end

  def allstations
    putsroute
    i = gets.to_i
    @routes[i]&.stations&.each { |x| puts x.name }
  end

  private

  def putstrain(_trains = @trains)
    puts 'Выберите поезд (введите соответствующий индекс массива)'
    j = -1
    @trains.each { |x| puts "Введите #{j += 1}, чтобы выбрать поезд номер", x.number }
    end

  def putsvagon(_vagons = @vagons)
    l = i
    puts 'Выберите вагон (введите соответствующий индекс массива)'
    z = 0
    @trains[l].list_of_vagons.each { |_x| puts "Введите #{z += 1}, чтобы выбрать вагон " }
    end

  def putsstation(_vagons = @stationlist)
    puts 'Выберите станцию (введите соответствующий индекс массива)'
    j = -1
    @stationlist.each { |x| puts "Введите #{j += 1}, чтобы выбрать станцию,", x.name }
    end

  def putsroute(_routes = @routes)
    puts 'Выберите путь (введите соответствующий индекс массива)'
    j = -1
    @routes.each { |x| puts "Введите #{j += 1}, чтобы выбрать маршрут", x }
    end

  private

  def create_cargo_train
    puts 'Введите номер поезда'
    number_of_train = gets.chomp!
    @trains << CargoTrain.new(number_of_train)
    end

  def create_pass_train
    puts 'Введите номер поезда'
    number_of_train = gets.chomp

    @trains << PassengerTrain.new(number_of_train)
  end
end
