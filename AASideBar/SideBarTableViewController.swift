//
//  SideBarTableViewController.swift
//  passenger
//
//  Created by chista imac on 2/23/1396 AP.
//  Copyright © 1396 amir Ardalan. All rights reserved.
//

import UIKit

protocol SideBarTableViewControllerDelegate {
    func sideBarSelectedItem(index : IndexPath)
    func closeSideBar()
}
class SideBarTableViewController: UIViewController {
    
    // MARK : Header User Inforamtion
    @IBOutlet weak var userProfile: CirculeImage!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userMoney: UILabel!
    // MARK :  Table View
    @IBOutlet weak var tableview: UITableView!
    // MARK : Footer 
    @IBOutlet weak var settingButton: UIButton!
    @IBOutlet weak var supportButton: UIButton!
    @IBOutlet weak var aboutButton: UIButton!
    
   
    var tableViewItem = [[SideBarModel]]()
    var delegate : SideBarTableViewControllerDelegate?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "SiderBarCell", bundle: nil)
        tableview.register(nib, forCellReuseIdentifier: "SiderBarTableViewCell")
        tableview.separatorStyle = UITableViewCellSeparatorStyle.none
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.update), name: NSNotification.Name(rawValue : __UserUpdate), object: nil)
    }

    @IBAction func closeMenu(_ sender: Any) {
        delegate?.closeSideBar()
    }
    
    @objc func update(){
        if let user = _User{
            updateWith(user: user)
        }
    }
    
    func updateWith(user : SuperUser){
        DispatchQueue.main.async {
            
     
        if let img = user.imageProfile{
            self.userProfile.kf.setImage(with: URL(string : IMGURL + img))
        }
        
        if let name = user.name {
            self.userName.text = "\(name)"
        }else{
            self.userName.text = user.mobileNumber ?? ""
        }
        
        if let money = user.credit {
            self.userMoney.text = _convertPriceDisplayComma(Price: "\(money)")
        }
        
           }
        
    }
    
    
 

}
extension SideBarTableViewController : UITableViewDelegate , UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return tableViewItem.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tableViewItem[section].count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell  = tableView.dequeueReusableCell(withIdentifier: "SiderBarTableViewCell") as? SiderBarTableViewCell
        
        
        if cell == nil {
            cell = SiderBarTableViewCell()
            
            cell?.backgroundColor = UIColor.clear
            cell?.textLabel?.textColor = UIColor.darkText
            
            let selectedView : UIView = UIView(frame: CGRect(x: 0, y: 0, width: cell!.frame.size.width, height: cell!.frame.size.height))
            selectedView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
            
            cell?.selectedBackgroundView = selectedView
            
        }
        let model = tableViewItem[indexPath.section][indexPath.row]
        cell!.itemTitle.text = model.title
        cell?.itemImg.image = UIImage(named: "\(model.image!)")
        
        // Configure the cell...
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.sideBarSelectedItem(index: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40.0
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section != 0 {
      //  let view = UIView()
           
            var headerView = UIView(frame: CGRect(x:0 , y: 0, width: self.tableview.bounds.width - 16, height: 5))
           // headerView.backgroundColor = UIColor.black
            
            // Add a bottomBorder
            var border = UIView(frame: CGRect(x:0,y:0,width:self.tableview.bounds.width - 16,height:1))
            border.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
            headerView.addSubview(border)
          
            return headerView
        }
        
        assert(false)
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return section == 0 ? 0.0 : 2
    }
}
