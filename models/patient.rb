class Patient
  attr_reader :name
  attr_accessor :room, :id

  # def room
  #   @room
  # end
  # def room=(new_room)
  #   @room = new_room
  # end

  def initialize(attributes = {})
    @id = attributes[:id] # integer
    @name = attributes[:name] # string
    @cured = attributes[:cured] || false # boolean
    @room = attributes[:room] # instance of a room
  end

  def cured?
    @cured
  end

  def cure!
    @cured = !@cured
  end
end

