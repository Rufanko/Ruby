# frozen_string_literal: true

class PassengerTrain < Train
  
  def initialize(number)
    super(type, number)
  end
  
  def type
  	'Passenger'
  end

  def take_vagon(vagon)
    if vagon.instance_of?(Passengervagon)
      super(vagon) 
    end  
  end
end
