//
//  MyPostsTable.swift
//  InputConConstraints
//
//  Created by Dominique Verellen on 12/7/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation
import UIKit

class MyPostsTable: UIViewController{
   
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return.lightContent
    }
    
    @IBOutlet weak var myPostsTable: UITableView!
    
    @IBAction func viewComments(_ sender: Any) {
    performSegue(withIdentifier: "viewCommentsOnMyPosts", sender: nil)
    }
    @IBAction func deletePost(_ sender: Any) {
        
    }
    
    
        
    var arrayPosts = [PostBE]()
    
    override func viewDidLoad() {
        self.myPostsTable.dataSource = self
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.getAllPosts();
    }
    
    func getAllPosts() {
        PostWS.getPostsByPersonId(personId: PersonBE.shared!.personId,success: {(arrayPosts) in
            self.arrayPosts = arrayPosts
            self.myPostsTable.reloadData()
        }, error: {(errorMessage) in
            print(errorMessage)
        })
    }
}


//Se encarga de llenar la tabla
extension MyPostsTable: UITableViewDataSource { //number, number, cellfor
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentidier = "MyPostsCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentidier, for: indexPath) as! MyPostsCell
        cell.delegate = self
        cell.parentViewController = self
        cell.objPost = self.arrayPosts[indexPath.row]
        return cell
    }
}


extension MyPostsTable: MyPostsDelegate {
    func placeTableViewCell(_ cell: MyPostsCell, deletePlace objPlace: PostBE) {
    }
}

