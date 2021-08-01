import 'package:bs_flutter_buttons/bs_flutter_buttons.dart';
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

  GlobalKey<FormState> _formState = GlobalKey<FormState>();

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
        body: Scrollbar(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Form(
                key: _formState,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 20.0),
                      child: BsInput(
                        size: BsInputSize.sm,
                        hintTextLabel: 'Small input',
                        controller: TextEditingController(),
                        validators: [BsInputValidators.required],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20.0),
                      child: BsInput(
                        style: BsInputStyle.outlineRounded,
                        size: BsInputSize.sm,
                        hintText: 'Small input',
                        controller: TextEditingController(),
                        validators: [BsInputValidators.required],
                        prefixIcon: Icons.people,
                        suffixIcon: Icons.cloud_upload_rounded,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20.0),
                      child: BsInput(
                        size: BsInputSize.md,
                        hintTextLabel: 'Medium input',
                        controller: TextEditingController(),
                        validators: [BsInputValidators.required],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20.0),
                      child: BsInput(
                        style: BsInputStyle.outlineRounded,
                        size: BsInputSize.md,
                        hintText: 'Medium input',
                        controller: TextEditingController(text: 'Testing'),
                        validators: [BsInputValidators.required],
                        prefixIcon: Icons.delete,
                        suffixIcon: Icons.panorama_fish_eye,
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
                        style: BsInputStyle.outlineRounded,
                        size: BsInputSize.lg,
                        obscureText: true,
                        hintText: 'Large input',
                        controller: TextEditingController(),
                        prefixIcon: Icons.info_outlined,
                        suffixIcon: Icons.article_rounded,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20.0),
                      child: BsInput(
                        style: BsInputStyle.outlineBottom,
                        size: BsInputSize.outlineBottomSm,
                        hintTextLabel: 'Small input',
                        controller: TextEditingController(),
                        suffixIcon: Icons.remove_red_eye,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20.0),
                      child: BsInput(
                        style: BsInputStyle.outlineBottom,
                        size: BsInputSize.outlineBottomMd,
                        hintTextLabel: 'Medium input',
                        controller: TextEditingController(),
                        suffixIcon: Icons.close,
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
                        validators: [BsInputValidators.required],
                        suffixIcon: Icons.reply,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20.0),
                      child: BsButton(
                        label: Text('Validate'),
                        prefixIcon: Icons.open_in_new,
                        style: BsButtonStyle.primary,
                        onPressed: () {
                          _formState.currentState!.validate();
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
