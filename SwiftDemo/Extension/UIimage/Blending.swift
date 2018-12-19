//
//  Blending.swift
//  SwiftDemo
//
//  Created by MTShawn on 2018/12/19.
//  Copyright © 2018 MT. All rights reserved.
//

import UIKit

class Blending: UIImage {

}

extension UIImage{
    /// 改变图片颜色
    func tintColor(color: UIColor, blendMode: CGBlendMode) -> UIImage{
        let drawrect = CGRect.init(x: 0, y: 0, width:size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
        color.setFill()
        UIRectFill(drawrect)
        draw(in: drawrect, blendMode: blendMode, alpha: 1.0)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
}
