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
            self.tableVirePosts.reloadData()
        }, error: {(errorMessage) in
            print(errorMessage)
        })
    }
    
    func postAComment (_ post: PostBE) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "PostViewController", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "CommentTable") as UIViewController
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated:true, completion:nil)
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
        self.postAComment(objPlace)
    }
}

