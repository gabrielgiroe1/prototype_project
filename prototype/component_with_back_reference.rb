require_relative 'prototype'
class ComponentWithBackReference
  attr_accessor :prototype

  # @param [Prototype] prototype
  def initialize(prototype)
    @prototype = prototype
  end
end