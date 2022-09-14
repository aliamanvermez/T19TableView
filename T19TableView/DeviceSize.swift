//
//  DeviceSize.swift
//  T19TableView
//
//  Created by NeonApps on 14.09.2022.
//

import Foundation
import UIKit


    var screenWidth = CGFloat()
    var screenHeight = CGFloat()

    func setDefaultSize(view: UIView){
        screenWidth = view.bounds.width
        screenHeight = view.bounds.height
    }
