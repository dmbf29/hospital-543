require 'csv'

class PatientRepository
  def initialize(csv_file_path, room_repository)
    @csv_file_path = csv_file_path
    @patients = []
    @next_id = 1
    @room_repository = room_repository
    load_csv
  end

  def add_patient(patient)
    # give the id to the patient
    patient.id = @next_id
    @next_id += 1
    @patients << patient
    save_csv
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol}
    CSV.foreach(@csv_file_path, csv_options) do |attributes|
      # attributes is a hash
      # we need to convert anything that isnt a string
      # we need update the attributes before we give to Patient.new
      attributes[:id] = attributes[:id].to_i
      attributes[:cured] = attributes[:cured] == 'true'

      # we need to ask the room repo to give us an instance
      # from the id
      # attributes[:room] = @room_repository.find(id)
      patient = Patient.new(attributes)
      room = @room_repository.find(attributes[:room_id].to_i)
      room.add_patient(patient)
      @patients << patient
      # @patients << Patient.new(
      #   id: row[0],
      #   name: row[1],
      #   cured: row[2]
      # )
    end
    @next_id = @patients.empty? ? 1 : @patients.last.id + 1
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << ['id', 'name', 'cured', 'room_id']
      @patients.each do |patient|
        csv << [patient.id, patient.name, patient.cured?, patient.room.id]
      end
    end
  end
end
