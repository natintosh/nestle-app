import 'dart:async';

import 'package:nestle_app/bloc/bloc_provider.dart';
import 'package:nestle_app/models/machine_model.dart';
import 'package:nestle_app/repository/repository.dart';

class MachineBloc extends BlocBase {
  final Repository _repository = Repository();

  StreamController _dataStreamController = StreamController<String>.broadcast();
  StreamController _fetchAllMachineStreamController =
      StreamController<List<MachineModel>>.broadcast();
  StreamController _fetchMachineStreamController =
      StreamController<MachineModel>.broadcast();

  Sink get machineDataSink => _dataStreamController.sink;

  Stream<String> get machineDataStream => _dataStreamController.stream;

  Sink get fetchAllMachineSink => _fetchAllMachineStreamController.sink;

  Stream<List<MachineModel>> get fetchAllMachineStream =>
      _fetchAllMachineStreamController.stream;

  Sink get fetchMachineSink => _fetchMachineStreamController.sink;

  Stream<MachineModel> get fetchMachineStream =>
      _fetchMachineStreamController.stream;

  String data;

  addData(String data) {
    this.data = data;
  }

  fetchAllMachines() async {
    List<MachineModel> machineModel = await _repository.fetchAllMachine();
    fetchAllMachineSink.add(machineModel);
  }

  fetchMachinesByID() async {
    MachineModel machineModel = await _repository.fetchMachineByID();
    fetchMachineSink.add(machineModel);
  }

  @override
  void dispose() {
    _dataStreamController?.close();
    _fetchAllMachineStreamController?.close();
    _fetchMachineStreamController?.close();
  }
}
