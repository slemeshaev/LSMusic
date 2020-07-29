//
//  CMTime + Extension.swift
//  LSMusic
//
//  Created by Станислав Лемешаев on 29.07.2020.
//  Copyright © 2020 Станислав Лемешаев. All rights reserved.
//

import UIKit
import AVKit

extension CMTime {
    
    func toDisplayString() -> String {
        guard !CMTimeGetSeconds(self).isNaN else { return "" }
        let totalSeconds = Int(CMTimeGetSeconds(self))
        let seconds = totalSeconds % 60
        let minutes = totalSeconds / 60
        let timeFormatString = String(format: "%02d:%02d", minutes, seconds)
        return timeFormatString
    }
    
}


