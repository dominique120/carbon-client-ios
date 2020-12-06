//
//  LogInViewController.swift
//  InputConConstraints
//
//  Created by Dominique Verellen on 10/11/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation
import UIKit

class LogInViewController: UIViewController {
    var arrayPersons = [Person]()
    /* LogIn Actions */
    @IBAction func clickCloseKeyboard(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    /* LogIn Outlets */
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var txtPssword: UITextField!
    @IBOutlet weak var mainBox: UIView!
    
    override func viewDidLoad() {
        self.setNeedsStatusBarAppearanceUpdate()
        
        super.viewDidLoad()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    
    @IBAction func onSignIn(_ sender: Any) {
        let usr: String = txtFirstName.text!
        let pwd: String = txtPssword.text!        
         
        AuthWS.doLogin(password: pwd, username: usr, success: { (_) in
            
            self.performSegue(withIdentifier: "TabBarApplication", sender: nil)
            
        }) { (errorMessage) in
            print(errorMessage)
        }
    
        
        
        
        /*
        let status: Int = self.sendAuthRequest(username: usr, password: pwd)
        if (status == 200) {
            self.sendToHomeScren()
        } else if (status == 403) {
            Util.showMessage(controller: self, message: "Credenciales invalidas!", seconds: 5.0)
        } else {
            Util.showMessage(controller: self, message: "Ocurrio un error!", seconds: 5.0)
        }
 */
    }
    /*
    func sendAuthRequest(username: String, password: String) -> Int {
        var authStatus: Int = 200
        /*
         let sem = DispatchSemaphore(value: 0)
         let params = ["username":username, "password":password] as Dictionary<String, String>
         
         var request = URLRequest(url: URL(string: Constants.api_base_url + "/validate_user")!)
         request.httpMethod = "POST"
         request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
         request.addValue("application/json", forHTTPHeaderField: "Content-Type")
         
         
         let session = URLSession.shared
         let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
         //print(response!)
         
         
         let string = String(data: request.httpBody!, encoding: .utf8)
         print(string!)
         
         if let httpResponse = response as? HTTPURLResponse {
         print(httpResponse.statusCode)
         let string = String(data: data!, encoding: .utf8)
         print(string!)
         
         
         
         
         
         if (httpResponse.statusCode == 200) {
         authStatus = 200
         } else if (httpResponse.statusCode == 403) {
         authStatus = 403
         } else {
         authStatus = -1
         }
         }
         sem.signal()
         /*
         do {
         let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
         print(json)
         } catch {
         print("error")
         }
         */
         })
         
         task.resume()
         sem.wait()
         */
        /*
        AuthWS.doLogin(password: password, username: username, success: {
            if g_personId == "-1" {
                authStatus = 403
            } else {
                authStatus = 200
                PersonWS.getPerson({(arrayPerson) in
                    g_personName = arrayPerson.first!.firstName + " " + arrayPerson.first!.lastName 
                }, personId: g_personId)
            }
        })
        
        return authStatus
 
    
        
    }
    */
        /*
    func sendToHomeScren() -> Void {
        print("isAuthenticated")
        let storyBoard : UIStoryboard = UIStoryboard(name: "TabBarViewController", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MainHome") as UIViewController
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated:true, completion:nil)
    }
    */
 */
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
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
        view.frame.origin.y = -keyboardFrame.size.height + 220
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        view.frame.origin.y = 0
    }
}


