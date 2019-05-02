//
//  ViewController2.swift
//  ProgrammingTabBarController
//
//  Created by Qingfeng Liu on 2018-12-16.
//  Copyright © 2018 Qingfeng Liu. All rights reserved.
//

import UIKit

class ViewController2: UIViewController,UITextFieldDelegate {

    let screenSize:CGRect = UIScreen.main.bounds
    var screenWidth = CGFloat(0)
    var screenHeight = CGFloat(0)
    var statusBarHeight = CGFloat(0)
    var navHeight:CGFloat?
    var tabHeight:CGFloat?
    let sideGap = CGFloat(15)
    //
    var scrollView = UIScrollView()
    let textField = UITextField()
    var keyboardHides = false
    var keyboardHeight = CGFloat(350)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .gray
        //NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: <#T##NSNotification.Name?#>, object: <#T##Any?#>)
        getScreenUIdata()
        addUIelements()
       
    }
    
    func keyboardWillShow(notification: NSNotification){
        
    }
    
    func addUIelements() {
        scrollView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        scrollView.backgroundColor = .blue
        self.view.addSubview(scrollView)
        //
        let backButton = UIButton()
        backButton.frame = CGRect(x: 100, y: 200, width: 150, height: 40)
        backButton.setTitle("Go back", for: .normal)
        backButton.backgroundColor = .black
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        scrollView.addSubview(backButton)
        //
        
        textField.frame = CGRect(x: 40, y: screenHeight - 100, width: screenWidth - 80, height: 50)
        textField.backgroundColor = .white
        textField.keyboardType = .emailAddress
        textField.delegate = self
        scrollView.addSubview(textField)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if self.textField.frame.origin.y + self.textField.frame.size.height > (screenHeight - keyboardHeight){
            //self.view.frame.origin.y -= keyboardHeight
            UIView.animate(withDuration: 0.5, animations: { self.view.frame.origin.y -= self.keyboardHeight})
            keyboardHides = true
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if keyboardHides {
           
            UIView.animate(withDuration: 0.5, animations: { self.view.frame.origin.y += self.keyboardHeight})
            keyboardHides = false
        }
        return true
    }
    
    
    @objc func goBack(){
        let backViewController = ViewController()
        self.present(backViewController, animated: false, completion: { print("go back upper level ")})
    }
    
    func getScreenUIdata(){
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        statusBarHeight = UIApplication.shared.statusBarFrame.height
        print("screen size width \(String(describing: screenWidth))")
        print("screen size height \(String(describing: screenHeight))")
        print("status bar height \(String(describing: statusBarHeight))")
        if let navgationController = self.navigationController {
            navHeight = navgationController.navigationBar.frame.size.height
            print("navigationBar height \(String(describing: navHeight)) ")
        } else {
            navHeight = CGFloat(0)
            print("There's no navigationBar.")
        }
        if let tabBarController = self.tabBarController {
            tabHeight = tabBarController.tabBar.frame.size.height
            print("tabBar height \(String(describing: tabHeight))")
        } else {
            tabHeight = CGFloat(0)
            print("There's no tabBar.")
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
