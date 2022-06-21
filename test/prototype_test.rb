require "test/unit"
require_relative '../prototype/component_with_back_reference'

class PrototypeTest < Test::Unit::TestCase
  def setup
    @p1 = Prototype.new
    @p1.primitive = 245
    @p1.component = Time.now
    @p1.circular_reference = ComponentWithBackReference.new(@p1)
    @p2 = @p1.clone
  end

  def test_clone
    assert_equal true, @p1.primitive == @p2.primitive, "@p1.primitive == @p2.primitive should return a boolean called 'true'"
  end

  def test_component
    assert_equal true, @p1.component == @p2.component, "@p1.primitive == @p2.primitive should return a boolean called 'true'"
  end
end