//
//  DetailViewController.swift
//  LeftSideMenuDemo
//
//  Created by Frank.Chen on 2017/4/16.
//  Copyright © 2017年 Frank.Chen. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var label: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "Detail"
        
        self.label = UILabel()
        self.label?.frame = CGRect(x: 0, y: self.view.frame.size.height / 2 - 50, width: self.view.frame.size.width, height: 100)
        self.label?.text = "Detail"
        self.label?.font = UIFont.systemFont(ofSize: (self.label?.frame.size.height)! * 0.2)
        self.label?.textAlignment = NSTextAlignment.center
        self.view.addSubview(self.label!)
    }
}





