//
//  GrayView.swift
//  SideBarExample
//
//  Created by Amir Ardalan on 9/2/18.
//  Copyright © 2018 amir. All rights reserved.
//

import UIKit

class GrayView: UIView , Connectable {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commit()
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
