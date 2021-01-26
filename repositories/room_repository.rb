require 'csv'

class RoomRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @rooms = []
    @next_id = 1
    load_csv
  end

  def add_room(room)
    # give the id to the room
    room.id = @next_id
    @next_id += 1
    @rooms << room
    save_csv
  end

  def find(id)
    # return one instance or nil
    @rooms.find do |room|
      room.id == id
    end
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol}
    CSV.foreach(@csv_file_path, csv_options) do |attributes|
      # attributes is a hash
      # we need to convert anything that isnt a string
      # we need update the attributes before we give to room.new
      attributes[:id] = attributes[:id].to_i
      attributes[:capacity] = attributes[:capacity].to_i
      # also patients....

      @rooms << Room.new(attributes)
      # @rooms << room.new(
      #   id: row[0],
      #   name: row[1],
      #   cured: row[2]
      # )
    end
    @next_id = @rooms.empty? ? 1 : @rooms.last.id + 1
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << ['id', 'capacity']
      @rooms.each do |room|
        csv << [room.id, room.capacity]
      end
    end
  end
end
