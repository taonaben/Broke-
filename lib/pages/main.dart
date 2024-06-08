import 'package:flutter/material.dart';
import 'package:stop_me_from_making_a_bad_financial_decision/pages/borrow_money_page.dart';
import 'package:stop_me_from_making_a_bad_financial_decision/pages/buy_something_page.dart';
import 'package:stop_me_from_making_a_bad_financial_decision/pages/go_on_date_page.dart';
import 'package:stop_me_from_making_a_bad_financial_decision/styles/buttons.dart';
import 'package:stop_me_from_making_a_bad_financial_decision/styles/typo.dart';

void main() {
  runApp(FinancialDecisionApp());
}

class FinancialDecisionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Financial Decision App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DecisionHomePage(),
    );
  }
}
  
class DecisionHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Financial Decision App',
          style: headerText,
        ),
      ),
      body: Stack(
        children: <Widget>[
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 350, // Modify width as needed
                  height: 300, // Modify height as needed
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(
                        0.8), // Optional: Add a background color with transparency
                    borderRadius: BorderRadius.circular(
                        10.0), // Optional: Add rounded corners
                  ),
                  child: Text(
                    "Ever Been in a Situation Where You Don\'t Know If You Should Do Something Because You Know You Are Broke?\n\n I Will Help!",
                    style: titletext,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  child: Text(
                    'Buying Something?',
                    style: btntext,
                  ),
                  style: buttonPrimary,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BuySomethingPage()),
                    );
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  child: Text(
                    'Going on a Date?',
                    style: btntext,
                  ),
                  style: buttonPrimary,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GoOnDatePage()),
                    );
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  child: Text(
                    'Borrowing Money?',
                    style: btntext,
                  ),
                  style: buttonPrimary,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BorrowMoneyPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
