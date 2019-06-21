import 'dart:async';

import 'package:nestle_app/models/machine_model.dart';
import 'package:nestle_app/provider/machine_provider.dart';

class Repository {
  final MachineApiProvider machineProvider = MachineApiProvider();

  Future<List<MachineModel>> fetchAllMachine() => machineProvider.getAllMachines();
  Future<MachineModel> fetchMachineByID() => machineProvider.getMachineByID();
}