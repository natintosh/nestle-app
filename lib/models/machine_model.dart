class MachineModel {
  final String id;
  final String machineID;
  final String name;
  final String location;
  final String zone;
  final String pending;
  final String resolved;
  final String completed;

  MachineModel.fromJSON(Map<String, dynamic> data) :
        id = data['idno'],
        machineID = data['machine_id'],
        name = data['name'],
        location = data['location'],
        zone = data['zone'],
        pending = '${0}',
        resolved = '${0}',
        completed = '${100}%';
}