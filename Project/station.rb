# frozen_string_literal: true

require_relative 'instance_counter.rb'
class Station
  include InstanceCounter
  attr_reader :trainlist, :name

  @@allstations = []

  def initialize(name)
    @name = name
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
end
