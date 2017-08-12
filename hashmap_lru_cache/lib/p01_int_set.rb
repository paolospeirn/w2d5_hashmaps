require 'byebug'
class MaxIntSet
  def initialize(max)
    @store = Array.new(max)
  end

  def insert(num)
    raise "Out of bounds" unless is_valid?(num)
    @store.insert(num-1,num)
  end

  def remove(num)
    @store.delete(num)
  end

  def include?(num)
    @store.include?(num)
  end

  private

  def is_valid?(num)
    num <= @store.length - 1 && num > 0
  end

# what's this validate! about?
  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    i = (num % 20)
    @store[i] << num
  end

  def remove(num)
    i = num % 20
      @store[i].delete(num)
  end

  def include?(num)
    i = num % 20
    @store[i].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if @count == (num_buckets)
    i = num % num_buckets
    unless self.include?(num)
      @store[i] << num
      @count += 1
    end


  end

  def remove(num)
    i = num % num_buckets
    @store[i].delete(num)
  end

  def include?(num)
    i = num % num_buckets
    @store[i].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    @count = 0
    old_length = num_buckets
    num_buckets = old_length * 2


    old_arr = @store.dup.flatten
    @store = Array.new(num_buckets) { Array.new }

    old_arr.each {|el| insert(el)}
  end
end

#     num_buckets.times do
#       @store << []
#     end
# # debugger
#     @store.each do |bucket|
#       bucket.each do |el|
#         @store.insert(el)
#       end
#     end
#
#    p self
#   end
