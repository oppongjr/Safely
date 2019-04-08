import 'package:flutter/material.dart';
import "package:easy_dialogs/easy_dialogs.dart";
import 'package:safely/src/screens/timer_screen.dart';
import 'duration_dialog.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double margin = 1.0;
  List<String> listItems = [
    "EarthGang",
    "TDE",
    "ROCAFELLA",
    'ALBANIA',
    'FOUR',
    'FIVE',
    'SIX',
    'SEVEN',
    'TEN',
    'ELEVEN'
  ];
  String selected;
  String durationSelected;
  bool takeOffstage = true;
  bool takeDurationLabelOffstage = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  // AppBar
                  Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: _buildAppBar()),
                  SizedBox(
                    height: 50.0,
                  ),
                  _buildButtonToTriggerDialog(),
                  SizedBox(
                    height: 50.0,
                  ),
                  _buildButtonToTriggerDuraationDialog(),
                  SizedBox(
                    height: 50.0,
                  ),
                  _buildTextField(),
                  SizedBox(
                    height: 30.0,
                  ),
                  _buildStartTimerButton()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return Row(
      children: <Widget>[
        Container(
          decoration: ShapeDecoration(
            shape: CircleBorder(
                side: BorderSide(
              width: 4.0,
              color: Colors.amber,
            )),
          ),
          child: Text("LOGO"),
        ),
        SizedBox(
          width: 300.0,
        ),
        Icon(
          Icons.settings,
          color: Colors.amberAccent[100],
          size: 32.0,
        ),
      ],
    );
  }

  Widget _buildButtonToTriggerDialog() {
    return RawMaterialButton(
      onPressed: () {
        _openDialog();
      },
      splashColor: Colors.grey,
      child: Container(
        width: 300.0,
        height: 50.0,
        decoration: ShapeDecoration(shape: OutlineInputBorder()),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 32.0),
              child: Text('Pick a duration'),
            ),
            SizedBox(
              width: 130.0,
            ),
            Icon(
              Icons.arrow_drop_down,
              size: 18.0,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildButtonToTriggerDuraationDialog() {
    return RawMaterialButton(
      onPressed: () {
        _showDurationPickerDialog();
      },
      splashColor: Colors.grey,
      child: Container(
        width: 300.0,
        height: 50.0,
        decoration: ShapeDecoration(shape: OutlineInputBorder()),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 32.0),
              child: Text('Select a duration'),
            ),
            SizedBox(
              width: 130.0,
            ),
            Icon(
              Icons.arrow_drop_down,
              size: 18.0,
            )
          ],
        ),
      ),
    );
  }

  String initial = "Buying a phone from Circle";

  List<String> dialogList = [
    'Taking a walk in the neighborhood',
    "Buying food from Madam Obeng's",
    "Buying a phone from Circle",
    "Going to Kobby's house",
    "Going out for a run through the neighborhood"
  ];

  List<double> durationList = [1];

  _openDialog() {
    showDialog(
        context: context,
        builder: (context) => SingleChoiceConfirmationDialog<String>(
              title: Text("Choose activity"),
              initialValue: initial,
              items: dialogList,
              onSelected: _onSelected,
            ));
  }

  _onSelected(dynamic value) {
    print('Selected $value');
  }

  void _showDurationPickerDialog() async {
    // this will contain the result of the Navigator.pop(context, result)
    final selectedMins = await showDialog(
        context: context, builder: (context) => DurationDialog());
  }

  Widget _buildTextField() {
    return Container(
      height: 220,
      margin: const EdgeInsets.all(8.0),
      padding: EdgeInsets.only(bottom: 40.0),
      child: TextField(
        keyboardType: TextInputType.multiline,
        maxLines: 99,
        decoration: InputDecoration(
            hintText: "What are you wearing? Are you picking a taxi?",
            border: OutlineInputBorder()),
      ),
    );
  }

  Widget _buildStartTimerButton() {
    return RawMaterialButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => TimerScreen()));
        },
        splashColor: Colors.green,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        fillColor: Colors.grey,
        child: Text("Start Timer"),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))));
  }
}