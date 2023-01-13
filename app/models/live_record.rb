class LiveRecord
  attr_accessor :name

  def self.all

    sql = "SELECT * FROM #{self.name.downcase + 's'}"
    DB[:conn].execute(sql)
  end

  def save
    sql = "INSERT INTO #{self.class.to_s.downcase + 's'} (name) VALUES ('#{self.name}')"
    DB[:conn].execute(sql)
  end
end

class Dog < LiveRecord
end

class Cat < LiveRecord
end

# Dog.all #=> 'SELECT * FROM dogs'
# Cat.all #=> 'SELECT * FROM cats'
