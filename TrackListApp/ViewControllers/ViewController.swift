//
//  ViewController.swift
//  TrackListApp
//
//  Created by Max Franz Immelmann on 11/8/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //content for reusableCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "reusableCell",
                                                 for: indexPath)
        // old way to use cell
        cell.textLabel?.text = "Cell index: \(indexPath.row)"
        return cell
    }
}
