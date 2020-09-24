//
//  Native.swift
//  plugin_example
//
//  Created by Tuan Hwing on 9/17/20.
//

import UIKit
import VNPTframework2

class Native2: NSObject, TextEditChangedObserver2 {
    
    static let shared = Native2();
    
    internal var params:Any?
    internal let eventHandler:EventHandler = EventHandler()
    
    override init() {
        super.init()
        VNPTNative2.shared.addObserver(self)
    }

    func getPlatformVersion(callback: @escaping FlutterResult) {
        callback(("iOS Native2" + VNPTNative2.shared.getPlatformVersion()));
    }
    
    func showStoryboard(params:Dictionary<String, String>? = nil) {
        VNPTNative2.shared.showStoryboard(params: params)
    }
    
    func textEditChanged(text: String?) {
        Native2.shared.eventHandler.sink?(["native2" : text ?? ""])
    }
}
