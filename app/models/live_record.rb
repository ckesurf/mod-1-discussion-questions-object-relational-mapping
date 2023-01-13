class LiveRecord
  
  def self.all
    # Add code here!
  end

  def save
    # Add code here!
  end
end

class Dog < LiveRecord
end

class Cat < LiveRecord
end

# Dog.all #=> 'SELECT * FROM dogs'
# Cat.all #=> 'SELECT * FROM cats'
