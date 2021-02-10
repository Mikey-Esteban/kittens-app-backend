class KittenSerializer
  include JSONAPI::Serializer
  attributes :name, :age, :cuteness, :softness
end
