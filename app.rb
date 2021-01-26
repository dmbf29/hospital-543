require_relative 'models/patient'
require_relative 'models/room'
require_relative 'repositories/room_repository'
require_relative 'repositories/patient_repository'

room_repository = RoomRepository.new('data/rooms.csv')
patient_repository = PatientRepository.new('data/patients.csv', room_repository)

# p room_repository
p patient_repository


# ken = Patient.new(name: 'ken')
# ryu = Patient.new(name: 'ryu')
# henry = Patient.new(name: 'henry')

# vip_room = Room.new(capacity: 2)
# cheap_room = Room.new(capacity: 15)
# # room_repository.add_room(vip_room)
# # room_repository.add_room(cheap_room)

# # # p ken
# # vip_room.add_patient(ken)
# # vip_room.add_patient(ryu)
# # cheap_room.add_patient(henry)

# # patient_repository.add_patient(ken)
# # patient_repository.add_patient(ryu)
# # patient_repository.add_patient(henry)

# p ryu
# p henry







# p vip_room
# p cheap_room



# "www.airbnb.com/rooms/1"

# room.user.first_name






#
