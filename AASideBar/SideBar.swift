//
//  SideBar.swift
//  passenger
//
//  Created by chista imac on 2/23/1396 AP.
//  Copyright © 1396 amir Ardalan. All rights reserved.
//

import UIKit
let __sideBarTag = 512
@objc protocol SideBarDelegate {
    func sideBarWillOpen()-> Bool
    @objc optional func sideBarWillClose()
    func sideBarSelectedItem(index : IndexPath)
}

public class SideBar: NSObject {
    
    public static let shared = SideBar()
    
    func sideBarSelectedItem(index: IndexPath) {
        delegate?.sideBarSelectedItem(index: index)
    }
    
    func closeSideBar() {
        showSideBar(shouldshow: false)
    }

    var barWidth : CGFloat = 150.0
    let sideBarcontainerView = UIView()
    var sideBarTableview : UIView?
    var widthConst , rightConst : NSLayoutConstraint?
    
    var origin : UIView!
    var animator : UIDynamicAnimator!
    var delegate : SideBarDelegate?
    var isSideBarOpen = false {
        didSet{
            changeState()
        }
    }
    var leftswipe : UISwipeGestureRecognizer?
    
    
    
    override init() {
        super.init()
    }
    
   public func create(source : UIView , addView : UIView , width : CGFloat  = 200) {
        origin = source
        sideBarTableview = addView
        animator = UIDynamicAnimator(referenceView: source)
        self.barWidth = width
        setupSideBar()
        //sideBarTableview?.tableViewItem = menuItem
        //sideBarTableview?.tableview.reloadData()
        
        let showGesture = UISwipeGestureRecognizer(target: self, action:#selector(SideBar.handleSwipe(recognizer:)))
        showGesture.direction = UISwipeGestureRecognizerDirection.left
        origin.addGestureRecognizer(showGesture)
        leftswipe = showGesture
        
        let hideGesture = UISwipeGestureRecognizer(target: self, action:#selector(SideBar.handleSwipe(recognizer:)))
        hideGesture.direction = UISwipeGestureRecognizerDirection.right
        origin.addGestureRecognizer(hideGesture)
        
        
    }
    
    func leftSwipeGestureState(isEnable enable : Bool){
        leftswipe?.isEnabled = enable
        
    }
    @objc func onSpaceClick(){
        self.showSideBar(shouldshow: false)
    }
    private func setupSideBar(){
        let gesture = UITapGestureRecognizer(target: self, action: #selector(onSpaceClick))
        sideBarcontainerView.addGestureRecognizer(gesture)
        sideBarcontainerView.frame = CGRect(x: origin.frame.size.width + barWidth + 1, y: origin.frame.origin.y, width: origin.frame.size.width, height: origin.frame.size.height)
        sideBarcontainerView.backgroundColor = UIColor.clear
        
        sideBarcontainerView.clipsToBounds = false
        sideBarcontainerView.tag = __sideBarTag
        origin.addSubview(sideBarcontainerView)
        
        sideBarcontainerView.translatesAutoresizingMaskIntoConstraints = false
       // leftConst = sideBarcontainerView.leftAnchor.constraint(equalTo: self.origin.leftAnchor )
       // leftConst?.isActive = true
       // leftConst?.constant =  0 //origin.frame.size.width + barWidth + 1
        widthConst = sideBarcontainerView.widthAnchor.constraint(equalToConstant: 0)
        widthConst?.isActive = true
        sideBarcontainerView.topAnchor.constraint(equalTo: self.origin.topAnchor).isActive = true
        sideBarcontainerView.bottomAnchor.constraint(equalTo: self.origin.bottomAnchor).isActive = true
        rightConst = sideBarcontainerView.rightAnchor.constraint(equalTo: self.origin.rightAnchor)
        rightConst?.isActive = true
        sideBarcontainerView.clipsToBounds = true
       
        sideBarcontainerView.addSubview(sideBarTableview!)
        sideBarTableview?.widthAnchor.constraint(equalToConstant: self.barWidth).isActive = true
        sideBarTableview?.translatesAutoresizingMaskIntoConstraints = false
        sideBarTableview?.rightAnchor.constraint(equalTo: self.sideBarcontainerView.rightAnchor).isActive = true
        sideBarTableview?.topAnchor.constraint(equalTo: self.sideBarcontainerView.topAnchor).isActive = true
        sideBarTableview?.bottomAnchor.constraint(equalTo: self.sideBarcontainerView.bottomAnchor).isActive = true
    }
    
   
    @objc func handleSwipe(recognizer : UISwipeGestureRecognizer){
        
        if let del = delegate ,  recognizer.direction == UISwipeGestureRecognizerDirection.left{
            if  del.sideBarWillOpen() {
                showSideBar(shouldshow: true)
            }
            
           
        }else{
            showSideBar(shouldshow: false)
            delegate?.sideBarWillClose?()
        }

        
    }
    
    public func toggel(){
        isSideBarOpen = !isSideBarOpen
    }
   public func showSideBar(shouldshow : Bool){
        animator.removeAllBehaviors()
        isSideBarOpen = shouldshow
    }
    
    private func changeState(){
        
        if let lastView = origin.subviews.last , lastView !== self.sideBarcontainerView {
            self.sideBarcontainerView.bringSubview(toFront: lastView)
        }
        self.sideBarcontainerView.alpha = 1// self.isSideBarOpen ? 1 : 0
        self.widthConst?.constant = UIScreen.main.bounds.width
        
       // self.widthConst?.constant = isSideBarOpen ?  UIScreen.main.bounds.width : 0
        UIView.animate(withDuration: 0.7, delay: self.isSideBarOpen ? 0 : 0.4, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.transitionFlipFromRight, animations: {
            
            self.origin.layoutIfNeeded()
            // self.sideBarcontainerView.frame.size.height = UIScreen.main.bounds.height
            // self.sideBarcontainerView.frame.size.width = UIScreen.main.bounds.width
             self.sideBarcontainerView.frame.origin.x = self.isSideBarOpen ? 0 : self.origin.frame.width + self.barWidth + 1
            self.sideBarcontainerView.alpha = self.isSideBarOpen ? 1 : 0
            
        }) { (succ : Bool) in
            
        }
        
        UIView.animate(withDuration: 0.8, delay: self.isSideBarOpen ? 0.5 : 0.0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: UIViewAnimationOptions.curveLinear, animations: {
            self.sideBarcontainerView.backgroundColor = UIColor.black.withAlphaComponent(self.isSideBarOpen ? 0.4 : 0.0)
        })
        
    }
}

