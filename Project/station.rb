# frozen_string_literal: true

require_relative 'instance_counter.rb'
require_relative 'module_manufacturer.rb'
require_relative 'validation.rb'
class Station
  include InstanceCounter
  include Validation
  attr_reader :trainlist, :name
  NAME_FORMAT = /^([a-zA-Z]){2,12}$/.freeze
  validate :name, :format, NAME_FORMAT

  @@allstations = []

  def initialize(name)
    @name = name
    validate!
    @trainlist = []
    @@allstations << self
    register_instance
  end

  def self.all
    @@allstations
  end

  def take_train(train)
    @trainlist.push(train)
  end

  def delete_train(train)
    @trainlist.delete(train)
  end

  def count(type)
    @trainlist.count { |train| train.type == type }
  end

  def enumerate
    trainlist.each { |train| yield(train) } if block_given?
  end

  protected

  # def validate!
  # raise "name can't be nil" if name.nil?
  # raise 'name has invalid format' if name !~ NAME_FORMAT
  # end
end
