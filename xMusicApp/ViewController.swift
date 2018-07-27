//
//  ViewController.swift
//  xMusicApp
//
//  Created by Hamada on 5/9/18.
//  Copyright © 2018 Hamada. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController {
    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func ButtonTapped(_ sender: UIButton) {
        MPMediaLibrary.requestAuthorization { (status) in
            if status == .authorized {
                self.PlayGenre(genre: sender.currentTitle!)
            }
        }
        
    }
    
    @IBAction func StopButtonTapped(_ sender: UIButton) {
        musicPlayer.stop()
    }
    
    @IBAction func NextButtonTapped(_ sender: UIButton) {
        musicPlayer.skipToNextItem()
    }
    func PlayGenre(genre:String){
        musicPlayer.stop()
        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
        query.addFilterPredicate(predicate)
        musicPlayer.setQueue(with: query)
        musicPlayer.shuffleMode = .songs
        musicPlayer.play()
    }
}

