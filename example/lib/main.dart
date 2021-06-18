import 'package:flutter/material.dart';
import 'package:bs_flutter_inputtext/bs_flutter_inputtext.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Input Text'),
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20.0),
                child: BsInput(
                  size: BsInputSize.sm,
                  hintText: 'Small input',
                  controller: TextEditingController(),
                  validators: [BsInputValidator.required],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20.0),
                child: BsInput(
                  size: BsInputSize.md,
                  hintTextLabel: 'Medium input',
                  controller: TextEditingController(),
                  validators: [BsInputValidator.required],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20.0),
                child: BsInput(
                  size: BsInputSize.lg,
                  obscureText: true,
                  hintTextLabel: 'Large input',
                  controller: TextEditingController(),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20.0),
                child: BsInput(
                  style: BsInputStyle.outlineBottom,
                  size: BsInputSize.outlineBottomSm,
                  hintTextLabel: 'Small input',
                  controller: TextEditingController(),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20.0),
                child: BsInput(
                  style: BsInputStyle.outlineBottom,
                  size: BsInputSize.outlineBottomMd,
                  hintTextLabel: 'Medium input',
                  controller: TextEditingController(),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20.0),
                child: BsInput(
                  style: BsInputStyle.outlineBottom,
                  size: BsInputSize.outlineBottomLg,
                  hintTextLabel: 'Large input',
                  maxLines: 5,
                  controller: TextEditingController(),
                  validators: [BsInputValidator.required],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
