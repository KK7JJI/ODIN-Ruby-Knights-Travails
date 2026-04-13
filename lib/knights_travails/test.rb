require 'json'

class Location
  def initialize(x = 1, y = 0)
    @x = x
    @y = y
  end

  def attributes
    # I produce a hash of instance variables in the class.
    instance_variables.map do |attribute|
      key = attribute.to_s.delete('@')
      [key, instance_variable_get(attribute)]
    end.to_h
  end

  def to_json(*a)
    {
      'json_class' => self.class.name,
      'data' => attributes
    }.to_json(*a)
  end

  def rebuild(value)
    case value
    when Hash
      if value.key?('json_class')
        klass = Object.const_get(value['json_class'])
        klass.json_create(value)
      end
      value.transform_values { |val| rebuild(val) }
    when Array
      value.map { |val| rebuild(val) }
    else
      # all other cases
      value
    end
  end

  def json_create(obj, hash)
    hash['data'].each do |key, value|
      obj.instance_variable_set("@#{key}", rebuild(value))
    end
    obj
  end

  def self.json_create(hash)
    obj = allocate
    obj.json_create(allocate, hash)
  end
end

loc = Location.new
save_state = loc.to_json

loc1 = JSON.load(save_state)
puts loc1.inspect
puts loc1.x
