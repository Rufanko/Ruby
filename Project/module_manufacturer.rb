# frozen_string_literal: true

module Manufacturer
  attr_accessor :company_name
end

module Valid
  def valid?
    validate!
    true
  rescue RuntimeError
    false
  end
end
