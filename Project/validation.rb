# frozen_string_literal: true

module Validation
  def self.included(base)
    base.extend Classmethods
    base.send :include, Instancemethods
  end

  module Classmethods
    attr_reader :validation_array
    def validate(name, type, args = nil)
      @validation_array ||= []
      @validation_array << [name, type, args]
    end
  end

  module Instancemethods
    def validate!
      self.class.validation_array.each do |name, type, args|
        var_name = instance_variable_get("@#{name}")
        send("validate_#{type}", var_name, args)
      end
    end

    def validate_presence(var_name, _args)
      raise "var name can't be nil " if var_name.nil?
    end

    def validate_format(var_name, args)
      raise 'format_error' if var_name !~ args
    end

    def validate_type(var_name, args)
      raise 'type error' unless var_name.is_a? args
    end

    def valid?
      validate!
      true
    rescue StandardError
      false
    end
    end
end
