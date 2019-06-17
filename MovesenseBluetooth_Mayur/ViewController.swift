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
    
    var device: MovesenseDevice?
    
    @IBOutlet weak var hrLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.movesense.setHandlers(deviceConnected: {_ in
            self.updateConnected()}, deviceDisconnected: { _ in
            self.updateDisconnected()
        }) { _ in
            self.updateDisconnected()
        }
        
        self.movesense.startScan({_ in self.peripheralFound()})
        
    }
    private func peripheralFound(){
        print("movesense found")
        self.movesense.stopScan()
        self.device = self.movesense.nthDevice(0)
        self.movesense.connectDevice(device!.serial)
        
    }
    
    private func updateConnected(){
        print("movesense connected")
        self.movesense.subscribe(self.device!.serial, path: Movesense.HR_PATH, parameters: [:], onNotify: { response in
            self.handleData(response)
        }) { _,_,_  in }
    }
    
    private func updateDisconnected(){
        print("movesense Disconnected")
    }
    private func updatebleOnOff(){
         print("Bluetooth toggled")
    }
    
    private func handleData(_ response: MovesenseResponse) {
        let json = JSON(parseJSON: response.content)
        if json["rrData"][0].number != nil {
            let rr = json["rrData"][0].doubleValue
            let hr = 60000/rr
            hrLabel.text=String(hr)

        }
    }
}

