module Enumerable
  # Your code goes here

  def my_each_with_index(&block)
    res = []
    self.size.times do |i|
      block_res = block.call(self[i], i)
      res.push(block_res.nil? ? self[i] : block_res)
    end
    res
  end

  def my_select(&block)
    res = []
    self.size.times do |i|
      is_included = block.call(self[i])
      res.push(self[i]) if is_included
    end
    res
  end

  def my_all?(&block)
    self.size.times do |i|
      is_passed = block.call(self[i])
      return false unless is_passed
    end
    true
  end

  def my_any?(&block)
    self.size.times do |i|
      is_passed = block.call(self[i])
      return true if is_passed
    end
    false
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each(&block)
    # takes a block as a parameter
    # returns array instance itself transformed by
    # whatever the block callback does to it
    res = []
    self.size.times do |i|
      block_res = block.call(self[i])
      res.push(block_res.nil? ? self[i] : block_res)
    end
    res
  end
end
