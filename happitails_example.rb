class Shelter
  attr_accessor :adoptable_pets, :client_list
  def initialize()
    @adoptable_pets = []
    @client_list = []
  end

  def bark
      puts "*woof*"
  end

  def pet_deposit(pet)
    adoptable_pets << pet
  end

  def add_client(client)
    client_list << client
  end

  def list_pets()
    puts "Adoptable pets:\n"
    @adoptable_pets.each { |pet| puts pet }
  end

  def list_clients ()
    @client_list.each do |client|
      puts client
    end
  end
end

class Client

    attr_accessor :name, :age, :gender, :kids, :num_pets
    def initialize(name, age, gender, kids, num_pets)
        @name = name
        @age = age
        @gender = gender
        @kids = kids
        @num_pets = num_pets
    end

    def donate_pet(name, breed, age, gender, favorite_toys)
        @num_pets -= 1
        puts "#{name}, a #{breed} was just donated to the shelter!\n\n"
        return Pet.new(name, breed, age, gender, favorite_toys)
    end

    def to_s
        "#{@name} is a #{@age} year old #{@gender} with #{@kids} kids and #{@num_pets} pets"
    end
end

class Pet

  attr_accessor :name, :breed, :age, :gender, :favorite_toys

  def initialize(name, breed, age, gender, favorite_toys)
    @name = name
    @breed = breed
    @age = age
    @gender = gender
    @favorite_toys = favorite_toys
  end

  def to_s
    s = "#{name}, #{breed}, #{age}, #{gender}   "
    s += "Favorite toys: "
    favorite_toys.each { |toy| s += toy + ", "}
    return s
  end
end

puts `clear`

happi_tails = Shelter.new

happi_tails.pet_deposit Pet.new("Charlotte", "pit bull", 3, "female", ["bone", "rope"])
happi_tails.pet_deposit Pet.new("Billy", "German shepherd", 1, "male", ["Frisbee", "ball", "rope"])
happi_tails.pet_deposit Pet.new("Gina", "mix", 2, "female", ["anything"])
happi_tails.pet_deposit Pet.new("Angel", "cocker spaniel", 8, "male", ["none"])
happi_tails.pet_deposit Pet.new("Tifa", "border collie", 3, "female", ["bone", "doll"])

happi_tails.add_client Client.new("Bob", 42, "male", 2, 0)
happi_tails.add_client Client.new("Mary", 22, "female", 0, 3)
happi_tails.add_client Client.new("Michael", 32, "male", 1, 2)
happi_tails.add_client Client.new("Jim", 73, "male", 7, 0)

sally = Client.new("Sally", 53, "female", 4, 7)
puts "A client arrives."
puts sally

puts "\nShe wants to see the client list."
happi_tails.list_clients

happi_tails.add_client sally
puts "\n\nSally has been added to the client list, here's the new list:\n"
happi_tails.list_clients

puts "\n\nNow she wants to see the adoptable pets.\n\n"
happi_tails.list_pets

puts "\nThe client has decided to give up her dog."
happi_tails.pet_deposit sally.donate_pet("Marian", "chihuahua", 3, "female", ["ball"])

puts "sally now has #{sally.num_pets} pets\n\n"

puts "Here's the new list of adoptable pets:\n"
happi_tails.list_pets

puts "There are #{happi_tails.adoptable_pets.count} pets at our shelter"