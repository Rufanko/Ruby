# frozen_string_literal: true

require_relative 'module_manufacturer.rb'
class Passengervagon < Vagon
  include Validation
  validate :total_space, :type, Integer
  def initialize(number = @@vagonnumber, total_space)
    super
    @type = 'Passenger'
  end

  def take_space
    super(1)
  end
end
