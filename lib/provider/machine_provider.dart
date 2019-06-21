import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nestle_app/models/machine_model.dart';

class MachineApiProvider {
  Future<List<MachineModel>> getAllMachines() async {
    final String url = 'http://machina.techbeaver.com.ng/machines';
    var client = http.Client();

    var response = await client.get(url);

    if (response.statusCode == 200) {
      print(response.body);
      return (json.decode(response.body) as List)
          .map((machine) => MachineModel.fromJSON(machine)).toList();
    }
    return null;
  }

  Future<MachineModel> getMachineByID() async {
    final String url = 'http://machina.techbeaver.com.ng/machines';
    var client = http.Client();

    var response = await client.get(url);

    if (response.statusCode == 200) {
      print(response.body);
      return (json.decode(response.body) as List)
          .map((machine) => MachineModel.fromJSON(machine)).first;
    }
    return null;
  }
}
