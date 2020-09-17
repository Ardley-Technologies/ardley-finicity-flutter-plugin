import Flutter
import UIKit
import Connect

public class SwiftFlutterSdkPlugin: NSObject, FlutterPlugin {

    var connectViewController: ConnectViewController = ConnectViewController()
    var connectNavController: UINavigationController = UINavigationController()

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_sdk", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterSdkPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

    func openConnect(url: String) {
        let config = ConnectViewConfig(connectUrl: url, loaded: self.connectLoaded, done: self.connectDone, cancel: self.connectCancelled, error: self.connectError)

        self.connectViewController = ConnectViewController()
        self.connectViewController.load(config: config)
    }
    func connectLoaded() {
        self.connectNavController = UINavigationController(rootViewController: self.connectViewController)
        self.connectNavController.modalPresentationStyle = .fullScreen
        UIApplication.shared.keyWindow?.rootViewController?.present(self.connectNavController, animated: true, completion: nil);
    }
    func connectDone(_ data: NSDictionary?) {
        UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true, completion: nil)
    }

    func connectCancelled() {
        UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true, completion: nil)
    }

    func connectError(_ data: NSDictionary?) {
        UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true, completion: nil)
    }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {

        if (call.method == "getPlatformVersion") {
            result("iOS " + UIDevice.current.systemVersion)
        }
        else if (call.method == "finicityConnectLite") {
            guard let args = call.arguments else {return}

            if let myArgs = args as? [String: Any],
            let url = myArgs["url"] as? String{
                DispatchQueue.main.async {
                    self.openConnect(url: url)
                    self.connectLoaded()
                }
            }

        } else {
            result(FlutterError(code: "-1", message: "iOS could not extract " +
               "flutter arguments in method: (sendParams)", details: nil))
        }
     }

}
