# frozen_string_literal: true

module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_accessor :sum
    end

  module InstanceMethods
    protected

    def register_instance
      self.class.sum ||= 0
      self.class.sum += 1
    end
  end
end
