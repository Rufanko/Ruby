# frozen_string_literal: true

require_relative 'instance_counter.rb'
class Station
  include InstanceCounter
  attr_reader :trainlist, :name

  NAME_FORMAT = /^([a-zA-Z]){2,12}$/.freeze
  @@allstations = []

  def initialize(name)
    @name = name
    @trainlist = []
    @@allstations << self
    register_instance
    validate!
  end

  def validate?
    validate!
    true
  rescue RuntimeError
    false
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
