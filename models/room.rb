class Room
  class CapacityReachedError < StandardError; end
  attr_reader :capacity, :patients
  attr_accessor :id

  def initialize(attributes = {})
    @id = attributes[:id] # integer
    @capacity = attributes[:capacity] || 0 # integer
    @patients = attributes[:patients] || [] # an array of instances
  end

  def full?
    @capacity == @patients.length
  end

  def add_patient(patient)
    raise CapacityReachedError, 'Room is full' if full?

    patient.room = self # self is the instance
    @patients << patient
  end
end

