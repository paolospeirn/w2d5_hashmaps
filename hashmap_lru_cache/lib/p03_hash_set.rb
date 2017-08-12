require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  # def hash(original)
  #   jesse = original.to_a.sort.flatten
  #   jesse.map! do |el|
  #
  #     el = sym_con(el) unless el.is_a?(Integer)
  #     el.to_s(2)
  #   end
  #     jesse.join.to_i
  # end
  #
  # def sym_con(sym)
  #   alphabet = ("a".."z").to_a
  #   sym = sym.to_s
  #   alphabet.index(sym.downcase)
  # end

  def insert(key)
    #helper method
    resize! if @count == (num_buckets)
  #  i = key % num_buckets
    unless self.include?(key)
      @store[self[key]] << key
      @count += 1
    end
  end

  def include?(key)
    @store[self[key]].include?(key)
  end

  def remove(key)
    @store[self[key]].delete(key)
  end

  private

  def [](key)
    garbage = hash(key)
    i = garbage % num_buckets
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end

######################
######################
######################
######################
######################

def hash(original)
  #if it's a single object (string, symbol)
  el = sym_con(el) unless el.is_a?(Integer)
  el.to_s(2)



  jesse = original.to_a.sort.flatten
  jesse.map! do |el|


  end
    jesse.join.to_i
end

def sym_con(sym)
  alphabet = ("a".."z").to_a
  sym = sym.to_s
  alphabet.index(sym.downcase)
end
