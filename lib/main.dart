import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_managemenet/application_color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<AplicationColor>(
       create: (context) => AplicationColor(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Consumer<AplicationColor>(
                builder: (context, aplicationColor, _) => Text(
                      "Provider State Management",
                      style: TextStyle(color: aplicationColor.color),
                    )),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Consumer<AplicationColor>(
                  builder: (context, applicationColor, _) => AnimatedContainer(
                    margin: EdgeInsets.all(5),
                    duration: Duration(milliseconds: 500),
                    height: 100,
                    width: 100,
                    color: applicationColor.color,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("AB"),
                    ),
                    Consumer<AplicationColor>(
                      builder: (context, applicationColor, _) => Switch(
                        value: applicationColor.isLightBlue,
                        onChanged: ((value) {
                            applicationColor.isLightBlue=value;
                        }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("LB"),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
