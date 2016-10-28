//
//  ViewController.swift
//  BNActivityIndicatorView
//
//  Created by Zied on 2016-02-13.
//  Copyright © 2016 Machine Art. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activityIndicatorView: BNActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addBNActivityIndicatorView()
    }
    
    func addBNActivityIndicatorView() {
        
        activityIndicatorView = BNActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge)
        
        let myImage = UIImage(named:"activityIndicator.png")
        // Set the image frame to be same size as the selected system UIActivityIndicatorViewStyle's frame
        // in this case UIActivityIndicatorViewStyle.WhiteLarge, so the size will be 37x37
        activityIndicatorView.fitSystemIndicatorFrame = true
        activityIndicatorView.image = myImage
        
        activityIndicatorView.center = self.view.center;
        self.view.addSubview(activityIndicatorView)
        activityIndicatorView.startAnimating()
        
        // Center constraints for activityIndicatorView
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalConstraint = NSLayoutConstraint(item: activityIndicatorView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0)
        view.addConstraint(horizontalConstraint)
        
        let verticalConstraint = NSLayoutConstraint(item: activityIndicatorView, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0)
        view.addConstraint(verticalConstraint)
        
    }
    
    @IBAction func stopindicator(sender: AnyObject) {
        
        let button : UIButton = sender as! UIButton
        
        if (activityIndicatorView.isAnimating()) {
            activityIndicatorView.stopAnimating()
            button.setTitle("Start Indicator", forState: UIControlState.Normal)
        }
        else {
            activityIndicatorView.startAnimating()
            button.setTitle("Stop Indicator", forState: UIControlState.Normal)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
// End BNActivityIndicatorViewTests

