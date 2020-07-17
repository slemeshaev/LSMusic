//
//  TrackDetailView.swift
//  LSMusic
//
//  Created by Станислав Лемешаев on 17.07.2020.
//  Copyright © 2020 Станислав Лемешаев. All rights reserved.
//

import UIKit

class TrackDetailView: UIView {
    
    @IBOutlet weak var trackImageView: UIImageView!
    @IBOutlet weak var currentTimeSlider: UISlider!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var durationTimeLabel: UILabel!
    @IBOutlet weak var trackTitleLabel: UILabel!
    @IBOutlet weak var authorTitleLabel: UILabel!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var volumeSlider: UISlider!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        trackImageView.backgroundColor = .red
    }
    
    // регулировка текущего времени трека
    @IBAction func handleCurrentTimeSlider(_ sender: UISlider) {
        //
    }
    
    // регулировка звука
    @IBAction func handleVolumeSlider(_ sender: UISlider) {
        //
    }
    
    // свернуть текущее воспроизведение
    @IBAction func dragDownButtonTapped(_ sender: UIButton) {
        self.removeFromSuperview()
    }
    
    // предыдущий трек
    @IBAction func previousTrack(_ sender: UIButton) {
        //
    }
    
    // следующий трек
    @IBAction func nextTrack(_ sender: UIButton) {
        //
    }
    
    // воспроизведение / остановка трека
    @IBAction func playPauseAction(_ sender: UIButton) {
        //
    }
    
    
}
