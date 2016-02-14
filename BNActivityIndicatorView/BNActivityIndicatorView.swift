//
//  BNActivityIndicatorView.swift
//  BNActivityIndicatorView
//
//  Created by Zied on 2016-02-13.
//  Copyright © 2016 Machine Art. All rights reserved.
//

import UIKit

class BNActivityIndicatorView: UIActivityIndicatorView {
    
    var imageView : UIImageView!
    var animation = CABasicAnimation()
    var customIconName : String?
    
    var fitSystemIndicatorFrame = true
    
    var image: UIImage? {
        
        willSet (newValue) {
            
            self.imageView?.removeFromSuperview()
            self.imageView = nil
            
            if (newValue != nil)
            {
                if (self.subviews.count > 0)
                {
                    self.subviews[0].hidden = true
                }
                
                self.imageView = UIImageView(image:newValue)
                self.imageViewFrame()
                
                self.addSubview(self.imageView)
                
                if ((self.imageView.layer.animationForKey("rotating") == nil))
                {
                    self.imageView.layer.addAnimation(self.animation, forKey: "rotating")
                }
            }

        }
    }
    
    func imageViewFrame() {
        
        if (self.fitSystemIndicatorFrame)
        {
            self.imageView.frame = self.bounds
        }
        else
        {
            let boundsSize      = self.bounds.size
            let imageViewSize   = self.imageView.frame.size
            let buttonFrame     = CGRect(x: (boundsSize.width - imageViewSize.width)/2, y: (boundsSize.height - imageViewSize.height)/2, width: imageViewSize.width, height: imageViewSize.height)
            self.imageView.frame = buttonFrame
        }
    }
    
    override init(activityIndicatorStyle style: UIActivityIndicatorViewStyle) {
        super.init(activityIndicatorStyle:style)
        
        self.setupView()
        
    }
    
    required init(coder: NSCoder) {
        super.init(coder:coder)
        
        self.setupView();

    }
    
    func setupView() {
        
        self.animation = CABasicAnimation(keyPath: "transform.rotation.z")
        
        self.animation.fromValue   = NSNumber(float:0.0)
        self.animation.toValue     = NSNumber(float:Float(2*M_PI))
        self.animation.duration    = 0.8
        self.animation.repeatCount = Float.infinity
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        if (self.customIconName != nil)
        {
            self.image = UIImage(named:self.customIconName!);
        }
    }
    
    override func intrinsicContentSize() -> CGSize {
        
        let height = Int(frame.size.height)
        let width = Int(frame.size.height)
        return CGSize(width: width, height: height)
    }
    
    override func startAnimating() {
        
        super.startAnimating()
        
        if (self.imageView != nil) {
            
            self.imageView.hidden = false;
            self.imageView.layer.addAnimation(self.animation, forKey: "rotating")
        }
    }
    
    override func stopAnimating() {
        
        super.stopAnimating()
        
        if (self.hidesWhenStopped)
        {
            self.imageView?.hidden = false;
        }
        
        self.imageView?.layer.removeAllAnimations()
    }
}
