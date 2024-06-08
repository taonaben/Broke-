import 'package:flutter/material.dart';
import 'package:stop_me_from_making_a_bad_financial_decision/styles/buttons.dart';
import 'package:stop_me_from_making_a_bad_financial_decision/styles/colors.dart';
import 'package:stop_me_from_making_a_bad_financial_decision/styles/typo.dart';

class GoOnDatePage extends StatefulWidget {
  @override
  _GoOnDatePageState createState() => _GoOnDatePageState();
}

class _GoOnDatePageState extends State<GoOnDatePage> {
  final _formKey = GlobalKey<FormState>();
  bool _isWorthIt = false;
  int _weeksKnown = 0;
  bool _vibesThere = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Going on a Date?'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'How long have you known them',
                    labelStyle: bodytext,
                    hintStyle: bodytext,
                    border: OutlineInputBorder(),
                    hintText: "Number of weeks"),
                keyboardType: TextInputType.number,
                onSaved: (value) => _weeksKnown = int.parse(value!),
              ),
              SwitchListTile(
                title: Text(
                  'Is she worth it?',
                  style: bodytext,
                ),
                value: _isWorthIt,
                onChanged: (value) => setState(() => _isWorthIt = value),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                child: Text(
                  'Submit',
                  style: btntext,
                ),
                style: button1,
                onPressed: () {
                  _formKey.currentState!.save();
                  if (!_isWorthIt) {
                    _showDecisionDialog('Don\'t go on the date.');
                  } else if (_weeksKnown < 4) {
                    _askVibesThere();
                  } else {
                    _showDecisionDialog('You can go on the date.');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _askVibesThere() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Are the vibes there?'),
        actions: <Widget>[
          TextButton(
            child: Text(
              'No',
              style: bodytext,
            ),
            onPressed: () {
              Navigator.pop(context);
              _showDecisionDialog('Don\'t go on the date.');
            },
          ),
          TextButton(
            child: Text(
              'Yes',
              style: bodytext,
            ),
            onPressed: () {
              Navigator.pop(context);
              _showDecisionDialog('You can go on the date.');
            },
          ),
        ],
      ),
    );
  }

  void _showDecisionDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Decision',
          style: titletext,
        ),
        content: Text(
          message,
          style: bodytext,
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              'OK',
              style: bodytext,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
