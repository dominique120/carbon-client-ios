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
    
    @IBAction func viewComments(_ sender: Any) {
        performSegue(withIdentifier: "viewPostComments", sender: nil)
    }
    

    @IBOutlet weak var tableViewPosts: UITableView!
    
    var arrayPosts = [PostBE]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.getAllPosts();
    }
    
    func getAllPosts() {
        PostWS.getAllPosts(success: {(arrayPosts) in
            self.arrayPosts = arrayPosts
            self.tableViewPosts.reloadData()
        }, error: {(errorMessage) in
            print(errorMessage)
        })
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
        cell.delegate = self
        cell.objPost = self.arrayPosts[indexPath.row]
        return cell
    }
}


extension MainPost: MainPostDelegate {    
    func placeTableViewCell(_ cell: PlaceTableViewCell, deletePlace objPlace: PostBE) {       
    }
}

