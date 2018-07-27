//
//  MyView.swift
//  xMusicApp
//
//  Created by Hamada on 5/9/18.
//  Copyright © 2018 Hamada. All rights reserved.
//

import UIKit
@IBDesignable
class MyView: UIView {
    @IBInspectable var FirstColor : UIColor = UIColor.clear{
        didSet{
            UpdateView()
        }
    }
    @IBInspectable var SecondColor : UIColor = UIColor.clear{
        didSet{
            UpdateView()
        }
    }
    override class var layerClass: AnyClass{
        get{
            return CAGradientLayer.self
        }
    }
    func UpdateView(){
        let Layer = self.layer as! CAGradientLayer
        Layer.colors = [FirstColor.cgColor,SecondColor.cgColor]
    }
   
}
