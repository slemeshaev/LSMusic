//
//  TrackDetailView.swift
//  LSMusic
//
//  Created by Станислав Лемешаев on 17.07.2020.
//  Copyright © 2020 Станислав Лемешаев. All rights reserved.
//

import UIKit
import SDWebImage
import AVKit

class TrackDetailView: UIView {
    
    @IBOutlet weak var trackImageView: UIImageView!
    @IBOutlet weak var currentTimeSlider: UISlider!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var durationTimeLabel: UILabel!
    @IBOutlet weak var trackTitleLabel: UILabel!
    @IBOutlet weak var authorTitleLabel: UILabel!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var volumeSlider: UISlider!
    
    let player: AVPlayer = {
        let avPlayer = AVPlayer()
        avPlayer.automaticallyWaitsToMinimizeStalling = false
        return avPlayer
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        trackImageView.backgroundColor = .red
    }
    
    func set(viewModel: SearchViewModel.Cell) {
        trackTitleLabel.text = viewModel.trackName
        authorTitleLabel.text = viewModel.artistName
        playTrack(previewUrl: viewModel.previewUrl)
        let string600 = viewModel.iconUrlString?.replacingOccurrences(of: "100x100", with: "600x600")
        guard let url = URL(string: string600 ?? "") else { return }
        trackImageView.sd_setImage(with: url, completed: nil)
    }
    
    private func playTrack(previewUrl: String?) {
        print("Пытаюсь включить трек по ссылке \(previewUrl ?? "Отсутствует")")
        guard let url = URL(string: previewUrl ?? "") else { return }
        let playerItem = AVPlayerItem(url: url)
        player.replaceCurrentItem(with: playerItem)
        player.play()
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
        if player.timeControlStatus == .paused {
            player.play()
            playPauseButton.setImage(#imageLiteral(resourceName: "pause"), for: .normal)
        } else {
            player.pause()
            playPauseButton.setImage(#imageLiteral(resourceName: "play"), for: .normal)
        }
    }
    
    
}
