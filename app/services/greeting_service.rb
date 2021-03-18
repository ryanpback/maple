class GreetingService
  attr_accessor :name, :greeting, :error

  def initialize(name:)
    @name = name
  end

  def generate_greeting
    self.greeting = "Hello #{name}!" if name_is_valid?
    self
  end

  class << self
    def greet(name)
      new(name: name).generate_greeting
    end
  end

  private

  def name_is_valid?
    name_is_valid = !!/[A-Za-z]/.match(name)
    self.error = 'No numbers allowed in name' unless name_is_valid
    name_is_valid
  end
end
