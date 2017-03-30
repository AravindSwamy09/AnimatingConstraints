//
//  ViewController.swift
//  AnimatingConstrainta
//
//  Created by ESS Mac Pro on 3/30/17.
//  Copyright © 2017 NGA Group Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var leftConstraint: NSLayoutConstraint!
    @IBOutlet var rightConstraint: NSLayoutConstraint!
    
    @IBOutlet var leftDoor: UIView!
    @IBOutlet var rightDoor: UIView!
    
    var doorOpen = false
    
    func triggerDoor() {
        self.view.layoutIfNeeded()
        
        UIView.animate(withDuration: 3, animations: {
            
            self.leftConstraint.constant = self.doorOpen ? 0 : -self.leftDoor.frame.size.width
            self.rightConstraint.constant = self.doorOpen ? 0 : -self.rightDoor.frame.size.width
            self.view.layoutIfNeeded()
            
        }) { (success) in
            
            self.doorOpen = self.doorOpen ? false:true
            self.triggerDoor()
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        triggerDoor()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

