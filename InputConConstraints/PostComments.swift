//
//  MainComment.swift
//  InputConConstraints
//
//  Created by user178961 on 11/30/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation
import UIKit

class MainComment: UIViewController{
    
    @IBAction func swipeRecognizer(_ sender: UISwipeGestureRecognizer) {
        if (sender.direction == .right) {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBOutlet weak var commentTable: UITableView!
    
    var arrayComments = [CommentBE]()
    
    override func viewDidLoad() {
        self.commentTable.dataSource = self
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.getPostComments();
    }
    
    func getPostComments() {
        CommentWS.getCommentsByPost(g_activePostId, success: {
            arrayComments in
            self.arrayComments = arrayComments
            self.commentTable.reloadData()
        }, error: {
            (errorMessage) in
            print(errorMessage)
        })
    }
        
    @IBOutlet weak var commentTextBox: UITextField!
    
    @IBAction func sendComment(_ sender: Any) {
        if (commentTextBox.text!.isEmpty) {
            Util.showMessage(controller: self, message: "Ingrese un comentario", seconds: 2)
        } else {
            
            CommentWS.newComment({
                Util.showMessage(controller: self, message: "Enviaste un comentario", seconds: 2)
                self.commentTextBox.text = ""
                self.getPostComments()
            }, {(errorMessage) in print(errorMessage)}, postId: g_activePostId, posterName: PersonBE.shared!.displayName, commentText: commentTextBox.text!, personId: PersonBE.shared!.personId)
        }
    }
    @IBOutlet weak var ConstraintCenterYContent: NSLayoutConstraint!
    @IBOutlet weak var ViewContent: UIView!
    
    @IBAction  func clickBtnBack(_ sender: Any){
        self.navigationController?.popViewController(animated: true)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return.lightContent
    }
    
    @IBAction func clickBtnCloseKeyboard(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillHide(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        
        let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        
        let finalPosYContent = self.ViewContent.frame.origin.y + self.ViewContent.frame.height
        let originKeyboardY = keyboardFrame.origin.y
        var delta: CGFloat = 0
        
        //let viewContentSpaceKeyboard: CGFloat = 10
        
        if originKeyboardY < finalPosYContent {
            delta = originKeyboardY - finalPosYContent
        }
        
        UIView.animate(withDuration: animationDuration) {
            self.ConstraintCenterYContent.constant = delta
            self.view.layoutIfNeeded()
            
        }
        
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        
        UIView.animate(withDuration: animationDuration) {
            self.ConstraintCenterYContent.constant = 0
            self.view.layoutIfNeeded()
            
        }
    }
}

extension MainComment: UITableViewDataSource { //number, number, cellfor
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayComments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentidier = "commentCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentidier, for: indexPath) as! MainCelda
        //cell.delegate = self
        cell.objComment = self.arrayComments[indexPath.row]
        return cell
    }
}
