# frozen_string_literal: true

class PassengerTrain < Train
  def initialize(type = 'Passenger', number)
    super
  end

  def take_vagon(vagon)
    super(vagon) if vagon.instance_of?(Passengervagon)
  end
end
