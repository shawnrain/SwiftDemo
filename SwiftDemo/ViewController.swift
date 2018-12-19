//
//  ViewController.swift
//  SwiftDemo
//
//  Created by MTShawn on 2018/12/19.
//  Copyright © 2018 MT. All rights reserved.
//

import UIKit

protocol ViewControlDelegate{
    func viewLoad()
}

class ViewController: UIViewController {
    var delegate : ViewControlDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view1 : ViewController = ViewController()
        view1.delegateTest()
        
        let view2 : ViewController = ViewController()
        view2.delegate = self
        view2.delegateTest()
        
    }
    func delegateTest(){
        delegate?.viewLoad()
    }
    
}

extension ViewController : ViewControlDelegate{
    
    func viewLoad() {
        print("=====")
    }
}

extension ViewController{
    func imageTest(){
        let image = UIImage.init(named: "看别人愿望-未点赞");
        let resultImg = image?.tintColor(color: UIColor.orange, blendMode: .destinationIn)
        let imageView = UIImageView.init(image: resultImg!)
        imageView.frame = CGRect.init(x: 100, y: 100, width: 50, height: 50)
        view.addSubview(imageView)
    }
}


extension UIImage{
    func imagesdsd(){
        let lDrawSize = CGRect.init(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
        UIColor.black.setFill()
        draw(in: lDrawSize, blendMode: .destinationIn, alpha: 1.0)
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
}
