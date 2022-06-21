require_relative 'component_with_back_reference'

p1 = Prototype.new
p1.primitive = 245
p1.component = Time.now
p1.circular_reference = ComponentWithBackReference.new(p1)

p2 = p1.clone

if p1.primitive == p2.primitive
  puts 'Primitive field values have been carried over to a clone.'
else
  puts 'Primitive field values have not been copied.'
end

if p1.component.equal?(p2.component)
  puts 'Simple component has not been cloned.'
else
  puts 'Simple component has been cloned.'
end

if p1.circular_reference.equal?(p2.circular_reference)
  puts 'Component with back reference has not been cloned.'
else
  puts 'Component with back reference has been cloned.'
end

if p1.circular_reference.prototype.equal?(p2.circular_reference.prototype)
  puts 'Component with back reference is linked to original object.'
else
  puts 'Component with back reference is linked to the clone.'
end
