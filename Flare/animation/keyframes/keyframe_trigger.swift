//
//  keyframe_trigger.swift
//  Flare
//
//  Created by Umberto Sonnino on 2/18/19.
//  Copyright © 2019 2Dimensions. All rights reserved.
//

import Foundation

class KeyFrameTrigger: KeyFrame {
    var _time: Double = 0.0
    
    func applyInterpolation(component: ActorComponent, time: Double, toFrame: KeyFrame, mix: Float) {
    }
    
    func apply(component: ActorComponent, mix: Float) {
    }
    
    func setNext(_ frame: KeyFrame) {
        // Do nothing.
    }
    
    func read(_ reader: StreamReader) -> Bool {
        if !self.readTime(reader) {
            return false
        }
        return true
    }
}
