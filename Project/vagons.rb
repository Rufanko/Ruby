# frozen_string_literal: true

require_relative 'module_manufacturer.rb'
class Vagon
  @@vagonnumber = 1
  include Manufacturer
  attr_reader :number, :free_space, :reserved_space
  def initialize(number = @@vagonnumber, free_space)
    @number = number
    @free_space = free_space
    @reserved_space = 0
    @@vagonnumber += 1
   end

  def take_space(space = 1)
    unless @free_space - space < 0
      @free_space -= space
      @reserved_space += space
      end
    end
end
