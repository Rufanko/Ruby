class Station

 attr_reader :trainlist

  def initialize(name)
    @name = name
    @trainlist = []
  end
  
  def take_train(train)
    @trainlist.push(train)
  end
  
  def delete_train(train)
    @trainlist.delete(train)
  end
  
  def count(type)
    i = @trainlist.count{|train| train.type == type}
  end
end

class Route

  attr_reader :stations

  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
  end
  
  def add_st(n=1,station)
     @stations.insert(n, station)
  end
  
  def delete_st(station)
     @stations.delete(station)
  end

  def first_station
    @stations[0]
  end

  def last_station
    i = @stations.length 
    @stations[i-1]
  end

  def show_stations_names
    puts @stations
  end 
end

class Train
  
  attr_reader :number_of_vagons, :type, :number
  
  def initialize(number, type, number_of_vagons)
    @number = number
    @type = type
    @number_of_vagons = number_of_vagons
  end
  
  def speed_up(speed)
    @speed += speed
  end
  
  def decrease_speed(value)
    if @speed > value
       @speed -= value
    end
  end
  
  def drop_vagon
   if @speed == 0
    if @number_of_vagons > 0
       @number_of_vagons -=1
    end
   end
  end
  
  def take_vagon
    if @speed == 0
       @number_of_vagons += 1
    end
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
       @trainroute.stations[@current_station_index+1]
    end
  end   
  
  def previous_station
    if @current_station_index > 0
       @trainroute.stations[@current_station_index-1]
    end
  end
  
  def move_fwd
    if next_station
       @current_station_index += 1
       current_station.take_train(self)
       @trainroute.stations[@current_station_index-1].delete_train(self)
    end
  end
  
  def move_back
    if previous_station    
        @current_station_index -= 1
        @trainroute.stations[@current_station_index].take_train(self)
        @trainroute.stations[@current_station_index+1].delete_train(self)      
    end
  end
end