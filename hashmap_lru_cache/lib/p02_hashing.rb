class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    jesse = self.dup

    jesse.map! {|el| el.to_s(2)}

    jesse.join.to_i
  end
end

class String
  def hash
    alphabet = ("a".."z").to_a
    jesse = []

    self.chars.each do |el|
      jesse << alphabet.index(el.downcase)
    end

    jesse.map! {|el| el.to_s(2)}

    jesse.join.to_i
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    jesse = self.to_a.sort.flatten

    jesse.map! do |el|
      el = sym_con(el) unless el.is_a?(Integer)
      el.to_s(2)
    end
      jesse.join.to_i

  end

  def sym_con(sym)
    alphabet = ("a".."z").to_a
    sym = sym.to_s
    alphabet.index(sym.downcase)
  end
end
