import Flutter
import UIKit

public class SwiftBsFlutterInputtextPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "bs_flutter_inputtext", binaryMessenger: registrar.messenger())
    let instance = SwiftBsFlutterInputtextPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
