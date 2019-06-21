import 'package:flutter/material.dart';
import 'package:nestle_app/bloc/bloc_provider.dart';
import 'package:nestle_app/bloc/machine_bloc.dart';
import 'package:nestle_app/models/machine_model.dart';

class MachinePage extends StatelessWidget {
  final String data;

  const MachinePage({@required this.data});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: MachineBloc(),
      child: Builder(builder: (BuildContext context) {
        final MachineBloc bloc = BlocProvider.of<MachineBloc>(context);
        bloc.addData(data);
        return Scaffold(
          appBar: AppBar(title: Text('Summary'),),
          body: SafeArea(child: MachinePageContent()),
        );
      }),
    );
  }
}

class MachinePageContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MachinePageContentState();
}

class MachinePageContentState extends State<MachinePageContent> {
  @override
  Widget build(BuildContext context) {
    final MachineBloc bloc = BlocProvider.of<MachineBloc>(context);
    bloc.fetchMachinesByID();
    return StreamBuilder(
      stream: bloc.fetchMachineStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
            child: buildMachineDetail(snapshot),
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget buildMachineDetail(AsyncSnapshot snapshot) {
    MachineModel item = (snapshot.data as MachineModel);
    return Column(
      children: <Widget>[
        ListTile(
          title: Text('ID'),
          subtitle: Text('${item.machineID}'),
        ),
        ListTile(
          title: Text('Name'),
          subtitle: Text('${item.name}'),
        ),
        ListTile(
          title: Text('Location'),
          subtitle: Text('${item.location}'),
        ),
        ListTile(
          title: Text('Zone'),
          subtitle: Text('${item.zone}'),
        ),
        Divider(),
        ListTile(
          title: Text('Pending'),
          subtitle: Text('${item.pending}'),
        ),
        ListTile(
          title: Text('Resolved'),
          subtitle: Text('${item.resolved}'),
        ),
        ListTile(
          title: Text('Completed'),
          subtitle: Text('${item.completed}'),
        ),

      ],
    );
  }
}
