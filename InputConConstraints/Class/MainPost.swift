//
//  MainPost.swift
//  InputConConstraints
//
//  Created by user178961 on 11/30/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation
import UIKit

class MainPost: UIViewController{
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return.lightContent
    }
    @IBOutlet weak var tableVirePosts: UITableView!
    
    var arrayPosts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.getAllPosts();
    }
    
    func getAllPosts() {
        PostBL.getAllPosts{ (arrayPosts) in
            self.arrayPosts = arrayPosts
            self.tableVirePosts.reloadData()
        }
    }
}


//Se encarga de llenar la tabla
extension MainPost: UITableViewDataSource { //number, number, cellfor
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentidier = "PlaceTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentidier, for: indexPath) as! PlaceTableViewCell
        cell.objPlace = self.arrayPosts[indexPath.row]
        
        return cell
    }
}
/*
 //Se encarga de notificar los eventos del usuario en la tabla
 extension MainPost: UITableViewDelegate {
 
 func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
 
 let objPlace = self.arrayPosts[indexPath.row]
 self.performSegue(withIdentifier: "MapViewController", sender: objPlace)
 }
 
 }
 */
