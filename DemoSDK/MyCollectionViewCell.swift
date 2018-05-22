//
//  MyCollectionViewCell.swift
//  DemoSDK
//
//  Created by kevin on 2018/5/18.
//  Copyright © 2018 KevinChang. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 取得螢幕寬度
        let w = Double(UIScreen.main.bounds.size.width)
        
        // 建立一個 UIImageView
        imageView = UIImageView(frame: CGRect(
            x: 0, y: 0,
            width: w/3 - 10.0 , height: w/3 - 10.0))
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        self.addSubview(imageView)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
