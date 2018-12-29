import 'package:flight_search/widget/multicity_input.dart';
import 'package:flight_search/widget/price_tab.dart';
import 'package:flutter/material.dart';

class ContentCard extends StatefulWidget {
  @override
  _ContentCardState createState() => _ContentCardState();
}

class _ContentCardState extends State<ContentCard> {
  bool showInput = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 14.0,
      margin: const EdgeInsets.all(8.0),
      child: DefaultTabController(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                _buildTabBar(),
                _buildContentContainer(viewportConstraints),
              ],
            );
          },
        ),
        
        length: 3,
      ),
    );
  }

  Widget _buildTabBar({bool showFirstOption}) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          top: null,
          child: Container(
            height: 2.0,
            color: Colors.cyan[50],
          ),
        ),
        TabBar(
          tabs: [
            Tab(text: "Flight"),
            Tab(text: "Train"),
            Tab(text: "Bus"),
          ],
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
        ),
      ],
    );
  }

  Widget _buildContentContainer(BoxConstraints viewportConstraints) {
    return Expanded(
      child: SingleChildScrollView(
        child: new ConstrainedBox(
          constraints: new BoxConstraints(
            minHeight: viewportConstraints.maxHeight - 48.0,
          ),
          child: new IntrinsicHeight(
            child: showInput
                ? _buildMulticityTab()
                : PriceTab(
                    height: viewportConstraints.maxHeight - 48.0,
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildMulticityTab() {
    return Column(
      children: <Widget>[
        MulticityInput(),
        Expanded(child: Container()),
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0, top: 8.0),
          child: FloatingActionButton(
            onPressed: () {
              setState(() {
                showInput = false;
              });
              /*
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AnimationTestPage()),
              );
              */
            },
            child: Icon(Icons.timeline, size: 36.0),
          ),
        ),
      ],
    );
  }
}
