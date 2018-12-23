import 'package:flight_search/widget/air_asir_bar.dart';
import 'package:flight_search/widget/content_card.dart';
import 'package:flight_search/widget/rounded_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AirAsiaBar(
            height: 200,
          ),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 40.0),
              child: Column(
                children: <Widget>[
                  _buildButtonsRow(),
                  Expanded(
                    child: ContentCard(),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildButtonsRow() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          RoundedButton(text: "ONE WAY"),
          RoundedButton(text: "ROUND"),
          RoundedButton(text: "MULTICITY", selected: true),
        ],
      ),
    );
  }
}
