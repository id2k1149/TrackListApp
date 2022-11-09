//
//  TrackDetailsViewController.swift
//  TrackListApp
//
//  Created by Max Franz Immelmann on 11/8/22.
//

import UIKit

class TrackDetailsViewController: UIViewController {

    @IBOutlet var artCoverImageView: UIImageView!
    @IBOutlet var trackTitleLabel: UILabel!
    
    var track: Track!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        artCoverImageView.image = UIImage(named: track.title)
        trackTitleLabel.text = track.title
    }
}
