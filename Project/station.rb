# frozen_string_literal: true

require_relative 'instance_counter.rb'
require_relative 'module_manufacturer.rb'
class Station
  include Valid
  include InstanceCounter
  attr_reader :trainlist, :name

  NAME_FORMAT = /^([a-zA-Z]){2,12}$/.freeze
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

  protected

  def validate!
    raise "name can't be nil" if name.nil?
    raise 'name has invalid format' if name !~ NAME_FORMAT
end
end
