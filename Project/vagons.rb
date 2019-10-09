# frozen_string_literal: true

require_relative 'module_manufacturer.rb'
class Vagon
  @@vagonnumber = 1
  include Manufacturer
  attr_reader :number, :free_space, :total_space, :type
  def initialize(number = @@vagonnumber, total_space)
    @number = number
    @total_space = total_space
    @free_space = total_space
    @reserved_space = 0
    @@vagonnumber += 1
   end

  def take_space(space)
    @free_space -= space unless (@total_space - space).negative?
  end

  def reserved_space
    @reserved_space = @total_space - @free_space
  end
end
