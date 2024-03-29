# frozen_string_literal: true

class PassengerTrain < Train
  def initialize(number)
    super
    @type = 'Passenger'
  end

  def take_vagon(vagon)
    super(vagon) if vagon.instance_of?(Passengervagon)
  end
end
