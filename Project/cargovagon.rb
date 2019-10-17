# frozen_string_literal: true

require_relative 'module_manufacturer.rb'
class Cargovagon < Vagon
  include Validation
  validate :total_space, :type, Integer
  def initialize(number = @@vagonnumber, total_space)
    super
    @type = 'Cargo'
  end
end
