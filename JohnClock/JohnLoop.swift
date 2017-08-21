//
//  JohnLoop.swift
//  JohnClock
//
//  Created by holdtime on 2017/8/18.
//  Copyright © 2017年 www.bthdtm.com 豪德天沐移动事业部. All rights reserved.
//

import UIKit

struct JohnAngle {
    
    var start:CGFloat!
    var end:CGFloat!
    
    init(_ startAngle:CGFloat, _ endAngle:CGFloat) {
        self.start = startAngle
        self.end = endAngle
    }
    
}

class JohnLoop: UIView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        
        layer.addSublayer(gradientLayer)

        layer.addSublayer(loopLayer)
        
        layer.addSublayer(startLayer)
        layer.addSublayer(endLayer)
        
    }
    
    /// one width default 35
    var loopSlider:(Bool,UIImage?,UIImage?) = (false,nil,nil){
        willSet{setNeedsDisplay()}
    }
    
    /// one width default 35
    var loopWidth:CGFloat = 35{
         willSet{setNeedsDisplay()}
    }
    
    /// one color default gray
    var loopColor:UIColor = UIColor.gray{
        willSet{setNeedsDisplay()}
    }

    /// one angle default 360
    var loopAngle:JohnAngle! = JohnAngle(-90, 360){
        willSet{setNeedsDisplay()}
    }

    /// one path
    var loopPath:UIBezierPath{
        
        var angle = JohnAngle(loopAngle.start,loopAngle.end)
        
        angle.start = angle.start/180.0*CGFloat.pi
        angle.end   = angle.end/180.0*CGFloat.pi
        
        let path = UIBezierPath(arcCenter: CGPoint(x: frame.width/2.0, y: bounds.height/2.0), radius: bounds.width/(3.0), startAngle:angle.start, endAngle:angle.end, clockwise: true)
        return path
    }
    
    /// arcPathStart
    var arcCenterStart:CGPoint{
        return calcCircleCoordinate(CGPoint(x: bounds.width/2.0, y: bounds.height/2.0), angle:-loopAngle.start+15, radius: bounds.width/(3.0))
    }
    /// arcPathEnd arc
    var arcCenterEnd:CGPoint{
        return calcCircleCoordinate(CGPoint(x: bounds.width/2.0, y: bounds.height/2.0), angle:-loopAngle.end-15, radius: bounds.width/(3.0))
    }
    
    /// one track
    var loopLayer:CAShapeLayer = {
        var shape = CAShapeLayer()
        shape.lineCap = kCALineCapRound
        shape.fillColor = UIColor.clear.cgColor
        
        return shape
    }()
    
    /// one startLayer
    var startLayer = CALayer()
    
    /// one endLayer
    var endLayer = CALayer()
    
    /// mask gradient
    var isGradientLayer:(Bool,[CGColor]?) = (false,[UIColor.green.cgColor,UIColor.blue.cgColor]){
        willSet{setNeedsDisplay()}
    }
    /// mask gradient
    private var gradientLayer:CAGradientLayer = {

        var gradien = CAGradientLayer()
        gradien.colors = [UIColor.green.cgColor,UIColor.blue.cgColor]
        gradien.startPoint = CGPoint(x: 0, y: 0)
        gradien.endPoint = CGPoint(x: 1, y: 1)
        return gradien
    }()
    
    func layer(_ layer:CALayer, frame:CGRect, position:CGPoint, cornerRadius:CGFloat, contents:Any?){
       
        layer.frame = frame
        layer.position = position
        layer.cornerRadius = cornerRadius
        layer.contents = contents
        layer.masksToBounds = true

    }
    
    override func draw(_ rect: CGRect) {
        
        if loopSlider.0 {
            
            layer(startLayer, frame: CGRect(origin: .zero, size: CGSize(width: loopWidth-10, height: loopWidth-10)), position:  arcCenterStart, cornerRadius: (loopWidth-10)/2, contents:  loopSlider.1?.cgImage)
            
            layer(endLayer, frame: CGRect(origin: .zero, size: CGSize(width: loopWidth-10, height: loopWidth-10)), position:  arcCenterEnd, cornerRadius: (loopWidth-10)/2, contents: loopSlider.2?.cgImage)
        }
        
        if isGradientLayer.0{
            gradientLayer.isHidden = false
            gradientLayer.frame = bounds
            gradientLayer.colors = isGradientLayer.1
            gradientLayer.mask = loopLayer

        }else{
            gradientLayer.isHidden = true
        }
        
        loopLayer.path = loopPath.cgPath
        loopLayer.lineWidth = loopWidth

        loopLayer.strokeColor = loopColor.cgColor
       
    }
    
    func calcCircleCoordinate(_ center:CGPoint, angle:CGFloat, radius:CGFloat)->CGPoint{
    
        let x = radius*CGFloat(cosf(Float(angle*CGFloat.pi/180)))
        let y = radius*CGFloat(sinf(Float(angle*CGFloat.pi/180)))
        return CGPoint(x:center.x+x, y: center.y-y)
    }
  

}
