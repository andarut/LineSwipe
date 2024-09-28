//
//  HEGameFrame.swift
//  LineSwipe
//
//  Created by Daniil Belov on 09.02.2018.
//  Copyright © 2018 Daniil Belov. All rights reserved.
//

import UIKit

class HEGameFrame {
    var images = [UIImageView]()
    var labels = [UILabel]()
    
    var scale = 0.6
    
    func addImageToView(img i: String, xpos:Double, ypos:Double, w:Double, h:Double) { //Добавить картинку для отображения
        if ypos + h > 0 && ypos < 1136 && xpos + w > 0 && xpos < 640 {
            let image = UIImage(named: i)
            let imageView = UIImageView(image: image!)
            imageView.frame = CGRect(x: xpos*scale, y: ypos*scale, width: w*scale, height: h*scale)
            images.append(imageView)
        }
    }
    
    func addImageToViewWithAlpha(img i: String, xpos:Double, ypos:Double, w:Double, h:Double, alpha a: CGFloat) { //Добавить картинку для отображения
        if ypos + h > 0 && ypos < 1136 && xpos + w > 0 && xpos < 640 {
            var image = UIImage(named: i)
            if image == nil {
                image = UIImage(named: "bson.png")
            }
            let imageView = UIImageView(image: image!)
            imageView.frame = CGRect(x: xpos*scale, y: ypos*scale, width: w*scale, height: h*scale)
            imageView.alpha = a
            images.append(imageView)
        }
    }
    
    func addTextToView(x: Double, y: Double, width w: Double, height h: Double, align: NSTextAlignment, font: String, size: Double, color: UIColor, text: String) {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: w*self.scale, height: h*self.scale))
        label.center = CGPoint(x: x*self.scale, y: y*self.scale)
        label.textAlignment = align
        label.font = UIFont(name: font, size: CGFloat(size)*CGFloat(self.scale))
        label.textColor = color
        label.text = text
        labels.append(label)
    }
    
    func viewImages(frame: UIView) { //отобразить картинки
        for i in images {
            frame.addSubview(i)
        }
        for i in labels {
            frame.addSubview(i)
        }
    }
    
    func removeImages(frame: UIView) { //отобразить картинки
        for i in images {
            i.removeFromSuperview()
        }
        for i in labels {
            i.removeFromSuperview()
        }
        images.removeAll()
        labels.removeAll()
    }
}

