//
//  JohnClock.swift
//  JohnClock
//
//  Created by holdtime on 2017/8/18.
//  Copyright © 2017年 www.bthdtm.com 豪德天沐移动事业部. All rights reserved.
//

import UIKit

class JohnClock: UIView {
    
    var track:JohnLoop!
    var limit:JohnLoop!
    var status:JohnLoop!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
 
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initView()

    }
    
    func initView(){
        
        track = JohnLoop(frame: bounds)
        track?.loopColor = UIColor.white
        
        limit = JohnLoop(frame:bounds)
        limit?.loopColor = UIColor.orange
        limit.loopSlider = (true,UIImage(named: "start"),UIImage(named: "start"))
        limit?.loopAngle = JohnAngle(-90, 180)
        
        status = JohnLoop(frame:bounds)
        status?.loopColor = UIColor.red
        status?.loopAngle = JohnAngle(-90, 100)
        
        status.isGradientLayer = (true,
                                  [UIColor(red: 133/255.0, green: 231/255.0, blue: 99/255.0, alpha: 1).cgColor,
                                 UIColor(red: 12/255.0, green: 224/255.0, blue: 243/255.0, alpha: 1).cgColor
            ])
        
        self.addSubview(track)
        self.addSubview(limit)
        self.addSubview(status)

        
        backgroundColor = UIColor(patternImage: UIImage(named: "clock_back")!)
        
    }

}
