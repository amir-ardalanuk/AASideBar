//
//  ViewController.swift
//  SideBarExample
//
//  Created by Amir Ardalan on 9/1/18.
//  Copyright © 2018 amir. All rights reserved.
//

import UIKit
import AASideBar
class ViewController: UIViewController  {

    @IBOutlet weak var ccView : UIView!
    var sideBarContainer : TableViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //SideBar.shared.create(source: self.view, addView: ccView!, width: 200)
        sideBarContainer = TableViewController.newInstance(delegate: self)
        SideBar.shared.create(source: self.view, addView: sideBarContainer!.view)
        
        
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            SideBar.shared.showSideBar(shouldshow: true)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            SideBar.shared.showSideBar(shouldshow: false)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onSideBarClick(_ sender: Any) {
        SideBar.shared.toggel()
    }
    

}
extension ViewController : TableViewDelegate {
    func clickOnItem(index: Int) {
        print("index selected : \(index)")
    }
    
    
}
