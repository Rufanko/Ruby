# frozen_string_literal: true

require_relative 'module_manufacturer.rb'
class Passengervagon < Vagon
  def type
    @type = 'Passenger'
 end
end
