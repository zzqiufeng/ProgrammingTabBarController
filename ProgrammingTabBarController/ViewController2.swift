//
//  ViewController2.swift
//  ProgrammingTabBarController
//
//  Created by Qingfeng Liu on 2018-12-16.
//  Copyright © 2018 Qingfeng Liu. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .gray
        let backButton = UIButton()
        backButton.frame = CGRect(x: 100, y: 200, width: 150, height: 40)
        backButton.setTitle("Go back", for: .normal)
        backButton.backgroundColor = .black
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        self.view.addSubview(backButton)
    }
    
    @objc func goBack(){
        let backViewController = ViewController()
        self.present(backViewController, animated: false, completion: { print("go back upper level ")})
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
