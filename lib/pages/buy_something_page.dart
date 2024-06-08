import 'package:flutter/material.dart';
import 'package:stop_me_from_making_a_bad_financial_decision/styles/buttons.dart';
import 'package:stop_me_from_making_a_bad_financial_decision/styles/colors.dart';
import 'package:stop_me_from_making_a_bad_financial_decision/styles/typo.dart';

class BuySomethingPage extends StatefulWidget {
  @override
  _BuySomethingPageState createState() => _BuySomethingPageState();
}

class _BuySomethingPageState extends State<BuySomethingPage> {
  final _formKey = GlobalKey<FormState>();
  String _itemName = '';
  double _itemPrice = 0;
  double _moneyOnHand = 0;
  bool _isWorthIt = false;
  bool _really = false;
  bool _hasSomethingToLose = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Buying Something?',
          style: headerText,
        ),
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
                    labelText: 'Item Name',
                    labelStyle: bodytext,
                    hintStyle: bodytext,
                    border: OutlineInputBorder(),
                    hintText: "Item name"),
                onSaved: (value) => _itemName = value!,
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'How much does it cost?',
                    labelStyle: bodytext,
                    hintStyle: bodytext,
                    border: OutlineInputBorder(),
                    hintText: "Amount"),
                keyboardType: TextInputType.number,
                onSaved: (value) => _itemPrice = double.parse(value!),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'How much do you have right now?',
                    labelStyle: bodytext,
                    hintStyle: bodytext,
                    border: OutlineInputBorder(),
                    hintText: "Amuunt"),
                keyboardType: TextInputType.number,
                onSaved: (value) => _moneyOnHand = double.parse(value!),
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
                  if (_itemPrice > _moneyOnHand) {
                    _showDecisionDialog('You can\'t afford it. Sorry.');
                  } else {
                    _askIsWorthIt();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _askIsWorthIt() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Is it worth it?',
          style: titletext,
        ),
        actions: <Widget>[
          TextButton(
            child: Text('No', style: bodytext),
            onPressed: () {
              Navigator.pop(context);
              _showDecisionDialog('Don\'t buy the item.');
            },
          ),
          TextButton(
            child: Text(
              'Yes',
              style: bodytext,
            ),
            onPressed: () {
              Navigator.pop(context);
              _askReally();
            },
          ),
        ],
      ),
    );
  }

  void _askReally() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Really?',
          style: titletext,
        ),
        actions: <Widget>[
          TextButton(
            child: Text('No', style: bodytext),
            onPressed: () {
              Navigator.pop(context);
              _showDecisionDialog('Don\'t buy the item.');
            },
          ),
          TextButton(
            child: Text(
              'Yes',
              style: bodytext,
            ),
            onPressed: () {
              Navigator.pop(context);
              _askHasSomethingToLose();
            },
          ),
        ],
      ),
    );
  }

  void _askHasSomethingToLose() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Do you have anything to lose if you don\'t buy it?',
          style: titletext,
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              'No',
              style: bodytext,
            ),
            onPressed: () {
              Navigator.pop(context);
              _showDecisionDialog('Don\'t buy the item.');
            },
          ),
          TextButton(
            child: Text(
              'Yes',
              style: bodytext,
            ),
            onPressed: () {
              Navigator.pop(context);
              _askMoreMoney();
            },
          ),
        ],
      ),
    );
  }

  void _askMoreMoney() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Do you have any more money?',
          style: titletext,
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              'No',
              style: bodytext,
            ),
            onPressed: () {
              Navigator.pop(context);
              _showDecisionDialog('Don\'t buy the item.');
            },
          ),
          TextButton(
            child: Text(
              'Yes',
              style: bodytext,
            ),
            onPressed: () {
              Navigator.pop(context);
              _showDecisionDialog('You can buy the item.');
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
