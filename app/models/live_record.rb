class LiveRecord
  # This is the dog or cat's name, as opposed to the Class name! which is used later
  attr_accessor :name

  def self.all
    # self.name.downcase + "s"
    sql = "SELECT * FROM #{self.name.downcase + 's'}"
    results = DB[:conn].execute(sql);
  end

  def save
    sql = "INSERT INTO #{self.class.to_s.downcase + 's'} (name) VALUES ('#{name}')"
    results = DB[:conn].execute(sql);
  end
end

class Dog < LiveRecord
end

class Cat < LiveRecord
end

# Dog.all #=> 'SELECT * FROM dogs'
# Cat.all #=> 'SELECT * FROM cats'
