//
//  TrackListViewController.swift
//  TrackListApp
//
//  Created by Max Franz Immelmann on 11/8/22.
//

import UIKit

class TrackListViewController: UITableViewController {
    
    var trackList = Track.getTrackList()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
        
        // navigation Edit button on left side
        navigationItem.leftBarButtonItem = editButtonItem
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        trackList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "track", for: indexPath)
        
        let track = trackList[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        
        content.text = track.song
        content.secondaryText = track.artist
        
        content.image = UIImage(named: track.title)
        content.imageProperties.cornerRadius = tableView.rowHeight / 2
        
        cell.contentConfiguration = content

        
        return cell
    }
    
    
    // MARK: - UITableViewDelegate
    
    /* method is too complicated in our case, we can use viewDidLoad with  tableView.rowHeight = 80
     
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // height in pointa
        80
    }
     */
    
    // when we use view segue
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(indexPath.row)
        let track = trackList[indexPath.row]
        
        // send track to prepare segue
        performSegue(withIdentifier: "showDetails", sender: track)
    }
    
    // remove delete icon
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .none
    }
    
    // remove movement of row
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        false
    }
    
    // move row + update tracklist
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let currentTrack = trackList.remove(at: sourceIndexPath.row)
        
        trackList.insert(currentTrack, at: destinationIndexPath.row)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailsVC = segue.destination as? TrackDetailsViewController else { return }
        
        // when we use button segue
//        guard let indexPath = tableView.indexPathForSelectedRow else { return }
//        detailsVC.track = trackList[indexPath.row]
        
        detailsVC.track = sender as? Track
    }
}
