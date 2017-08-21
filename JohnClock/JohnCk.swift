////
////  JohnClock.swift
////  JohnClock
////
////  Created by holdtime on 2017/8/18.
////  Copyright © 2017年 www.bthdtm.com 豪德天沐移动事业部. All rights reserved.
////
//
//import UIKit
//
//struct JohnClockTime {
//    
//    var limit:JohnDate!
//    var start:JohnDate!
//    
//    init(_ limitDate:JohnDate, _ time:JohnDate) {
//        limit = limitDate
//        start = time
//    }
//}
//
//
//struct JohnDate {
//
//    var start:Date!
//    var end:Date!
//    
//    init(_ startDate:Date, _ endDate:Date) {
//        self.start = startDate
//        self.end   = endDate
//    }
//}
//
////struct JohnAngle {
////    
////    var start:CGFloat!
////    var end:CGFloat!
////    
////    init(_ startAngle:CGFloat, _ endAngle:CGFloat) {
////        self.start = startAngle
////        self.end = endAngle
////    }
////    
////}
//
//
//class JohnClock: UIView {
//    
//    /// make background venation
//    ///
//    var backgroundImage:UIImage = UIImage(named:"clock_back")!{
//    
//        didSet{
//            setNeedsDisplay()
//        }
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        
//        drawPath(nil, trackWidth: 40)
//
//        self.layer.addSublayer(backtrackLayer)
//
//        self.layer.addSublayer(trackLayer)
//        trackLayer.lineWidth = trackWidth
//
//        self.layer.addSublayer(timeLayer)
//        timeLayer.lineWidth = trackWidth
//        
//        self.layer.addSublayer(gradientLayer)
//        gradientLayer.frame = bounds
//        gradientLayer.mask = timeLayer
//
//        self.backgroundColor = UIColor(patternImage: backgroundImage)
//        
//    }
//    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        
//    }
//    
//    //trackWidth 
//    private var trackWidth:CGFloat!
//    
//    /// angle  
//    private var limitAngle:JohnAngle!
//    private var clockAngle:JohnAngle!
//    
//    /// back
//    private var backPath:UIBezierPath{
//        
//        let path = UIBezierPath(arcCenter: CGPoint(x: frame.width/2, y: frame.height/2), radius: frame.width/(3.0), startAngle:0, endAngle:360, clockwise: true)
//        return path
//    }
//
//  
//    /// limit
//    private var limitPath:UIBezierPath{
//
//           let path = UIBezierPath(arcCenter: CGPoint(x: frame.width/2, y: frame.height/2), radius: frame.width/(3.0), startAngle: limitAngle.start, endAngle: limitAngle.end, clockwise: true)
//        
//        return path
//    }
//    
//    /// clock
//    private var clockPath:UIBezierPath{
//            let path = UIBezierPath(arcCenter: CGPoint(x: frame.width/2, y: frame.height/2), radius: frame.width/(3.0), startAngle: clockAngle.start, endAngle: clockAngle.end, clockwise: true)
//            return path
//    }
//    
//    /// back track
//    private var backtrackLayer:CAShapeLayer = {
//        var shape = CAShapeLayer()
//        shape.lineCap = kCALineCapRound
//        shape.strokeColor = UIColor.white.cgColor
//        shape.fillColor = UIColor.clear.cgColor
//        
//        return shape
//    }()
//    
//    /// track
//    private var trackLayer:CAShapeLayer = {
//        var shape = CAShapeLayer()
//        shape.lineCap = kCALineCapRound
//        shape.strokeColor = UIColor.lightGray.cgColor
//        shape.fillColor = UIColor.clear.cgColor
//
//        return shape
//    }()
//    
//    /// time
//    private var timeLayer:CAShapeLayer = {
//        var shape = CAShapeLayer()
//        shape.lineCap = kCALineCapRound
//        shape.strokeColor = UIColor.red.cgColor
//        shape.fillColor = UIColor.clear.cgColor
//        return shape
//    }()
//    
//    /// gradient
//    private var gradientLayer:CAGradientLayer = {
//        
//        var gradien = CAGradientLayer()
//        gradien.colors = [UIColor.green.cgColor,UIColor.blue.cgColor]
//        gradien.startPoint = CGPoint(x: 0, y: 0)
//        gradien.endPoint = CGPoint(x: 1, y: 1)
//        return gradien
//    }()
//    
//    override func draw(_ rect: CGRect) {
//        
//        
//        limitPath.stroke()
//        clockPath.stroke()
//        backPath.stroke()
//        
//        backtrackLayer.path = backPath.cgPath
//        backtrackLayer.lineWidth = trackWidth
//        
//        clockPath.lineCapStyle = CGLineCap.round
//        clockPath.lineJoinStyle = CGLineJoin.miter
//        
//        trackLayer.path = limitPath.cgPath
//        trackLayer.lineWidth = trackWidth
//        
//        timeLayer.path  = clockPath.cgPath
//        timeLayer.lineWidth = trackWidth
//
//
//    }
//
//    private func drawPath(_ date:JohnClockTime? , trackWidth width:CGFloat){
//        trackWidth = width
//
//        limitAngle = JohnAngle((-90/180.0)*CGFloat.pi, (180/180.0)*CGFloat.pi)
//        clockAngle = JohnAngle((-60/180.0)*CGFloat.pi, (80/180.0)*CGFloat.pi)
//        
//        setNeedsDisplay()
//
//    }
//    
//}
