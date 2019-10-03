# frozen_string_literal: true

class Station
  attr_reader :trainlist, :name

  def initialize(name)
    @name = name
    @trainlist = []
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
