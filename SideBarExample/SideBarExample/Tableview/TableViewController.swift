//
//  TableViewController.swift
//  SideBarExample
//
//  Created by Amir Ardalan on 9/1/18.
//  Copyright © 2018 amir. All rights reserved.
//

import UIKit
protocol TableViewDelegate {
    func clickOnItem(index : Int)
}
class TableViewController: UIViewController {

    var delegate : TableViewDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

  
    @IBAction func onItemClick(_ sender: Any) {
        guard let btn = sender as? UIButton else {return}
        self.delegate?.clickOnItem(index: btn.tag)
    }
    
}
extension TableViewController {
    static func newInstance(delegate : TableViewDelegate)->TableViewController{
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tableView") as? TableViewController
        vc?.delegate = delegate
        return vc!
    }
}
