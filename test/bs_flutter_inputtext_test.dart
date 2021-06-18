import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bs_flutter_inputtext/bs_flutter_inputtext.dart';

void main() {
  const MethodChannel channel = MethodChannel('bs_flutter_inputtext');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });
}
