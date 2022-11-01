# ORM Discussion Questions

Consider the following questions with the people at your table. Write down your
answers in a notebook or on a whiteboard.

1. First, discuss with your table - what is an ORM? Why is an ORM useful?

```
Answer: ORM is an Object Relation Mapping. It's useful because we can write all the SQL code within a Ruby class. Each column is an attribute. Each row is an instance. Each table is a class.
```

2. Pretend that you're building Twitter. Let's say that a tweet has a message
   and belongs to a User. A User has a username and has_many tweets. What
   columns would be on those two tables?

```
Answer:
User table
- id INTEGER primary key
- username TEXT

Tweet table
- id INTEGER (primary key),
- message TEXT
- user_id INTEGER (foreign key)
```

3. Now that we have our tables, pretend that we are defining a method on our
   User class that returns all the tweets. What SQL fires when this method is
   called?

```
Answer:
SELECT * FROM tweets;
```

4. Writing out all of these database interactions by hand can be messy. How
   would you create a method on the superclass to make sure the correct SQL
   fires for each class?

```rb
class LiveRecord
  # This is the dog or cat's name, as opposed to the Class name! which is used later
  attr_accessor :name

  def self.all
    # self.name.downcase + "s"
    sql = "SELECT * FROM #{self.name.downcase + 's'}"
    results = DB[:conn].execute(sql);
  end
end

class Dog < LiveRecord
end

class Cat < LiveRecord
end

# Dog.all #=> 'SELECT * FROM dogs'
# Cat.all #=> 'SELECT * FROM cats'
```
