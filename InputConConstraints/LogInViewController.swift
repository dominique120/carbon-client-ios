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
        
        
        let params = ["username":usr, "password":pwd] as Dictionary<String, String>
        
        var request = URLRequest(url: URL(string: Constants.api_base_url + "/auth")!)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        

        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            //print(response!)
            
                if let httpResponse = response as? HTTPURLResponse {
                //print(httpResponse.statusCode)
                //let string = String(data: data!, encoding: .utf8)
                //print(string!)
                    
                    if (httpResponse.statusCode == 200) {
                        // Not working
                        // Thread violation
                        // UI cant be managed in background thread
                        /*
                        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

                        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeScreen") as UIViewController
                        self.present(nextViewController, animated:true, completion:nil)
                        */
                    } else if (httpResponse.statusCode == 403) {
                        self.showMessage(controller: self, message: "Credenciales invalidas!", seconds: 5.0)
                    } else {
                        self.showMessage(controller: self, message: "Ocurrio un error!", seconds: 5.0)
                    }
            }
            
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
    
    func showMessage(controller: UIViewController, message : String, seconds: Double) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.view.backgroundColor = UIColor.black
        alert.view.alpha = 0.6
        alert.view.layer.cornerRadius = 15

        controller.present(alert, animated: true)

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            alert.dismiss(animated: true)
        }
    }
}


