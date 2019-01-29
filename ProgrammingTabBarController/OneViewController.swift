//
//  OneViewController.swift
//  ProgrammingTabBarController
//
//  Created by Qingfeng Liu on 2018-12-16.
//  Copyright © 2018 Qingfeng Liu. All rights reserved.
//

import UIKit

class OneViewController: UIViewController {

    let colors : [UIColor] = [.red,.green,.blue,.yellow,.lightGray,.white,.cyan,.orange,.brown]
    static var viewControllerLevel = 1
    var goneToNext = false
    var button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let color = Int.random(in: 0 ..< colors.count)
        self.view.backgroundColor = colors[color]
        print("This is \(OneViewController.viewControllerLevel) level Tab1ViewController")
        //Static member 'viewControllerLevel' cannot be used on instance of type 'Tab1ViewController'
        //Insert 'Tab1ViewController.'
    }
    
    override func viewWillLayoutSubviews() {
        button.frame = CGRect(x: 50, y: 200, width: 260, height: 45)
    }
    
    @objc func goNextSameView(){
        let nextView = OneViewController()
        goneToNext = true
        OneViewController.viewControllerLevel += 1
        self.navigationController?.pushViewController(nextView, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if goneToNext {
            print("OneViewController goes back from \(OneViewController.viewControllerLevel) level")
            goneToNext = false
            OneViewController.viewControllerLevel -= 1
            print("to \(OneViewController.viewControllerLevel) level")
        } else {
            button = {
                let bn = UIButton()
                bn.setTitle("\(OneViewController.viewControllerLevel) Go to next view controller", for: .normal)
                bn.addTarget(self, action: #selector(goNextSameView), for: .touchUpInside)
                bn.backgroundColor = .gray
                return bn
            }()
            self.view.addSubview(button)
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
