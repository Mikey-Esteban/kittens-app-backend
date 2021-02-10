Kitten.destroy_all

def grab_name
  name = Faker::FunnyName.name
  name
end

def grab_random_number
  number = rand(1...10)
  number
end

kittens = []

50.times do
  Kitten.create({
    name: Faker::FunnyName.name,
    age: grab_random_number,
    cuteness: grab_random_number,
    softness: grab_random_number
  })
end
