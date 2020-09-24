import Flutter
import UIKit

public class SwiftFlutterPlugin_2Plugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "PluginDemo2", binaryMessenger: registrar.messenger())
        let instance = SwiftFlutterPlugin_2Plugin()
        registrar.addMethodCallDelegate(instance, channel: channel)

        //Stream
        let eventChannel = FlutterEventChannel(name: "PluginStream2", binaryMessenger: registrar.messenger())
        eventChannel.setStreamHandler(Native2.shared.eventHandler)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if (call.method == "getPlatformVersion") {
            Native2.shared.getPlatformVersion(callback: result)
        }
        else if (call.method == "showNative") {
            if let params = call.arguments as? Dictionary<String, String>{
                Native2.shared.params = params
                Native2.shared.showStoryboard(params:params)
                return
            }
            Native2.shared.showStoryboard()


        }
  }
}
