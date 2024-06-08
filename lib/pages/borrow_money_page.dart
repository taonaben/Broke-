import 'package:flutter/material.dart';
import 'package:stop_me_from_making_a_bad_financial_decision/styles/buttons.dart';
import 'package:stop_me_from_making_a_bad_financial_decision/styles/typo.dart';

class BorrowMoneyPage extends StatefulWidget {
  @override
  _BorrowMoneyPageState createState() => _BorrowMoneyPageState();
}

class _BorrowMoneyPageState extends State<BorrowMoneyPage> {
  final _formKey = GlobalKey<FormState>();
  double _amount = 0;
  bool _canRepay = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Borrowing Money?'),
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
                    labelText: 'Amount',
                    labelStyle: bodytext,
                    hintStyle: bodytext,
                    border: OutlineInputBorder(),
                    hintText: "How much do you want to borrow"),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an amount';
                  }
                  final amount = double.tryParse(value);
                  if (amount == null || amount <= 0) {
                    return 'Please enter a valid amount greater than zero';
                  }
                  return null;
                },
                onSaved: (value) => _amount = double.parse(value!),
              ),
              SwitchListTile(
                title: Text(
                  'Can you repay it?',
                  style: bodytext,
                ),
                value: _canRepay,
                onChanged: (value) => setState(() => _canRepay = value),
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
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    if (_amount <= 0 || !_canRepay) {
                      _askIsWorthIt();
                    } else {
                      _showDecisionDialog('You can borrow the money.');
                    }
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
              _showDecisionDialog('Don\'t borrow the money.');
            },
          ),
          TextButton(
            child: Text(
              'Yes',
              style: bodytext,
            ),
            onPressed: () {
              Navigator.pop(context);
              _askParents();
            },
          ),
        ],
      ),
    );
  }

  void _askParents() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Have you asked your parents for the money?',
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
              _askParentsFirst();
            },
          ),
          TextButton(
            child: Text(
              'Yes',
              style: bodytext,
            ),
            onPressed: () {
              Navigator.pop(context);
              _askDoYouReallyNeedIt();
            },
          ),
        ],
      ),
    );
  }

  void _askParentsFirst() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Can you ask your parents for the money?',
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
              _askDoYouReallyNeedIt();
            },
          ),
          TextButton(
            child: Text(
              'Yes',
              style: bodytext,
            ),
            onPressed: () {
              Navigator.pop(context);
              _showDecisionDialog('Ask your parents for the money.');
            },
          ),
        ],
      ),
    );
  }

  void _askDoYouReallyNeedIt() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Do you really need it?',
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
              _showDecisionDialog('Don\'t borrow the money.');
            },
          ),
          TextButton(
            child: Text(
              'Yes',
              style: bodytext,
            ),
            onPressed: () {
              Navigator.pop(context);
              _showDecisionDialog('You can borrow the money.');
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
