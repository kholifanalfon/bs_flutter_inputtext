## Getting Started
Add the dependency in `pubspec.yaml`:

```yaml
dependencies:
  ...
  bs_flutter_inputtext: any
```

### Text Input
Example: [`example.dart`](https://github.com/kholifanalfon/bs_flutter_inputtext/blob/main/example/lib/main.dart)

![Alt text](https://raw.githubusercontent.com/kholifanalfon/bs_flutter_inputtext/main/screenshot/example.png "Screenshot Example Badge")

Small Input Text with Outline Border
```dart
// ...
  BsInput(
    size: BsInputSize.sm,
    hintText: 'Small input',
    controller: TextEditingController(),
    validators: [
      BsValidator.required
    ],
  ),
// ...
```

Small Input Text with Border Bottom
```dart
//...
  BsInput(
    style: BsInputStyle.outlineBottom,
    size: BsInputSize.outlineBottomSm,
    hintTextLabel: 'Small input',
    controller: TextEditingController(),
  ),
//...
```
`BsValidator` is custom validator, you can create yours validator using `BsValidator`
Example: 
```dart
  static BsValidator get required => BsValidator(
    validator: (value) {
      String valueValidate = value.toString().trim();
      if(valueValidate.isEmpty) return "Field tidak boleh kosong";

      return null;
    },
  );
```
`validator` properties will call when form on validating
