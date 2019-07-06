//
//  ViewController.swift
//  MovesenseBluetooth_Mayur
//
//  Created by Mayur Bhandary on 6/11/19.
//  Copyright © 2019 Mayur Bhandary. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {
    internal let movesense = (UIApplication.shared.delegate as! AppDelegate).movesenseInstance()
    
    @IBOutlet weak var hrLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.movesense.setHandlers(deviceConnected: {(serial: String) ->() in self.updateConnected(serial:serial)},deviceDisconnected: { _ in
            self.updateDisconnected()}, bleOnOff: { _ in
            self.updatebleOnOff()})
        self.movesense.startScan({(device:MovesenseDevice)-> () in self.peripheralFound(device: device)})
    }
    
    private func peripheralFound(device:MovesenseDevice){
        print("movesense found")
        
        print("There are \(self.movesense.getDeviceCount()) devices")
        self.movesense.connectDevice(device.serial)
        print("Device: \(device.serial) just connected")
    }
    
    private func updateConnected(serial: String){
        print("movesense connected: \(serial)")
        self.movesense.subscribe(serial, path: Movesense.HR_PATH, parameters: [:], onNotify: { response in self.handleData(response, serial: serial)}) { _,_,_  in }
    }
    
    private func updateDisconnected(){
        print("movesense Disconnected")
    }
    private func updatebleOnOff(){
         print("Bluetooth toggled")
    }
    
    private func handleData(_ response: MovesenseResponse, serial: String) {
        let json = JSON(parseJSON: response.content)
        if json["rrData"][0].number != nil {
            let rr = json["rrData"][0].doubleValue
            let hr = 60000/rr
            hrLabel.text=String(hr)
            print("device: \(serial) Heart Rate: \(String(hr))")
        }
    }
}

