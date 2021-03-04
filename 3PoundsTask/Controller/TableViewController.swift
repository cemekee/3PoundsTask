//
//  TableViewController.swift
//  3PoundsTask
//
//  Created by Cem Eke on 3.03.2021.
//

import UIKit

class TableViewController: UITableViewController {
    var albums = [Album]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let urlString = "https://jsonplaceholder.typicode.com/albums"
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url){
               parse(json: data)
            }
            
        }
    }
    func parse(json: Data){
        let decoder = JSONDecoder()
        if let jsonAlbums = try? decoder.decode(Albums.self, from: json) {
            albums = jsonAlbums.results
            tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let album = albums[indexPath.row]
        cell.textLabel?.text = album.title
        cell.detailTextLabel?.text = album.title
        return cell
    }

}
