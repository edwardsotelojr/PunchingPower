//
//  DeviceMotionController.swift
//  Watch-App-Sampler WatchKit Extension
//
//  Created by DCSnail on 2018/6/25.
//  Copyright © 2018年 DCSnail. All rights reserved.
//  DCSnail: https://github.com/wangyanchang21WatchOS
//  watchOS开发教程: https://blog.csdn.net/wangyanchang21/article/details/80928126
//

import UIKit
import WatchKit
import CoreMotion

class DeviceMotionController: WKInterfaceController {
    
    @IBOutlet var AccXLabel: WKInterfaceLabel!
    @IBOutlet var AccYLabel: WKInterfaceLabel!
    @IBOutlet var AccZLabel: WKInterfaceLabel!
    @IBOutlet var AccXMaxLabel: WKInterfaceLabel!
    @IBOutlet var AccYMaxLabel: WKInterfaceLabel!
    @IBOutlet var AccZMaxLabel: WKInterfaceLabel!
    @IBOutlet var AccXMinLabel: WKInterfaceLabel!
    @IBOutlet var AccYMinLabel: WKInterfaceLabel!
    @IBOutlet var AccZMinLabel: WKInterfaceLabel!
    
    var AccXMax = 0.0;
    var AccXMin = 0.0;
    var AccYMax = 0.0;
    var AccYMin = 0.0;
    var AccZMax = 0.0;
    var AccZMin = 0.0;
    
    
    lazy var motionManager: CMMotionManager = {
        let manager = CMMotionManager()
        manager.deviceMotionUpdateInterval = 0.1
        return manager
    }()
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        if motionManager.isDeviceMotionAvailable {
            
            motionManager.startDeviceMotionUpdates(to: OperationQueue.main) { (data, error) in
                
                if let userAcceleration = data?.userAcceleration {
                    if(self.AccXMax < userAcceleration.x){
                        self.AccXMaxLabel.setText(String(format: "%.2f", userAcceleration.x))
                    }
                    if(self.AccYMax < userAcceleration.x){
                        self.AccYMaxLabel.setText(String(format: "%.2f", userAcceleration.y))
                    }
                    if(self.AccZMax < userAcceleration.x){
                        self.AccZMaxLabel.setText(String(format: "%.2f", userAcceleration.z))
                    }
                    if(self.AccXMin > userAcceleration.x){
                        self.AccXMinLabel.setText(String(format: "%.2f", userAcceleration.x))
                    }
                    if(self.AccYMin > userAcceleration.x){
                        self.AccYMinLabel.setText(String(format: "%.2f", userAcceleration.y))
                    }
                    if(self.AccZMin > userAcceleration.x){
                        self.AccZMinLabel.setText(String(format: "%.2f", userAcceleration.z))
                    }
                    
                    
                    self.AccXLabel.setText(String(format: "%.2f", userAcceleration.x))
                    self.AccYLabel.setText(String(format: "%.2f", userAcceleration.y))
                    self.AccZLabel.setText(String(format: "%.2f", userAcceleration.z))
                }
            }
        } else {
            print("Not Available")
        }
    }
    
    override func didDeactivate() {
        super.didDeactivate()
        
        motionManager.stopDeviceMotionUpdates()
    }
}
