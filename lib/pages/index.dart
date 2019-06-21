import 'package:flutter/material.dart';
import 'package:nestle_app/bloc/bloc_provider.dart';
import 'package:nestle_app/bloc/index_bloc.dart';
import 'package:nestle_app/pages/help.dart';
import 'package:nestle_app/pages/home.dart';

class IndexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: IndexBloc(),
      child: Scaffold(
        body: SafeArea(child: _IndexPageContent()),
      ),
    );
  }
}

class _IndexPageContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IndexPageContentState();
}

class _IndexPageContentState extends State<_IndexPageContent> {
  int currentIndex = 1;
  List<Widget> tabItems = [HomePage(), HelpPage()];

  void _navigateToScanPage() {
    Navigator.of(context).pushNamed('/scan');
  }
  
  @override
  Widget build(BuildContext context) {
    return _buildIndex();
  }

  Widget _buildIndex() {
    final IndexBloc bloc = BlocProvider.of<IndexBloc>(context);
    return StreamBuilder(
      initialData: 0,
      stream: bloc.indexStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Scaffold(
          body: tabItems[snapshot.data],
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: _navigateToScanPage,
            child: Icon(Icons.filter_center_focus),
          ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: snapshot.data,
              onTap: bloc.changeCurrentIndex,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), title: Text('Home')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.help), title: Text('Help')),
              ]),
        );
      },
    );
  }
}
