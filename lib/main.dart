import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  bool? _value1 = false;
  bool? _value2 = false;

  void _showBottom() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (BuildContext context,
              StateSetter setState /*You can rename this!*/) {
            return Container(
              padding: const EdgeInsets.all(15.0),
              child: LimitedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: CheckboxListTile(
                        value: _value1,
                        onChanged: (bool? value) =>
                            setState(() => _value1 = value!),
                        title: const Text('Ashutosh'),
                        controlAffinity: ListTileControlAffinity.leading,
                        //subtitle: Text('Subtitle'),
                        secondary: const Icon(Icons.people),
                        activeColor: Colors.red,
                      ),
                    ),
                    Expanded(
                      child: CheckboxListTile(
                        value: _value2,
                        onChanged: (bool? value) =>
                            setState(() => _value2 = value!),
                        title: const Text('Ajit Sir'),
                        controlAffinity: ListTileControlAffinity.leading,
                        //subtitle: Text('Subtitle'),
                        secondary: const Icon(Icons.people),
                        activeColor: Colors.red,
                      ),
                    ),
                    Flexible(
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Close'),
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom sheet'),
      ),
      body: Container(
          padding: const EdgeInsets.all(32.0),
          child: Center(
            child: Column(
              children: <Widget>[
                const Text('Select a person:'),
                ElevatedButton(
                    onPressed: _showBottom, child: const Text('Show names')),
              ],
            ),
          )),
    );
  }
}
