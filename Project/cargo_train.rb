# frozen_string_literal: true

class CargoTrain < Train
  def initialize(number)
    super(type, number)
  end

  def type
    'Cargo'
  end

  def take_vagon(vagon)
    super vagon if vagon.instance_of?(Cargovagon)
   end
end
