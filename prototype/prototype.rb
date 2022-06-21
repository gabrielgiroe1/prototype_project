class Prototype
  attr_accessor :primitive, :component, :circular_reference

  def initialize
    @primitive = nil
    @component = nil
    @circular_reference = nil
  end

  # @return [Prototype]
  def clone
    @component = deep_copy(@component)

    @circular_reference = deep_copy(@circular_reference)
    @circular_reference.prototype = self
    deep_copy(self)
  end

  private def deep_copy(object)
    Marshal.load(Marshal.dump(object))
  end
end
