//
//  Connectable.swift
//  Tarabar
//
//  Created by Amir Ardalan on 4/21/18.
//  Copyright © 2018 Golrang. All rights reserved.
//

import Foundation
import UIKit
protocol Connectable {}

extension Connectable where Self: UIView {
    func commit() {
        let nib = UINib(nibName: String(describing: Self.self), bundle: nil)
        let views = nib.instantiate(withOwner: self, options: nil)
        guard let view = views.first as? UIView else {return}
        view.frame = bounds
        view.accessibilityIdentifier = "\(String(describing: Self.self))"
        addSubview(view)
    }
}
