//
//  PlaceHolderView.swift
//  VirtualCoins
//
//  Created by 任超 on 2018/5/28.
//  Copyright © 2018年 Abyss. All rights reserved.
//

import UIKit
import Kingfisher

/**
 * defualt image: "placeholder"
 *
 * Useage: PlaceHolderView.place(v)
 */
class PlaceHolderView: UIView {
    var icon: UIImageView!
    override init(frame: CGRect) {
        super.init(frame: frame)

        icon = UIImageView()
        self.addSubview(icon)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class func place(_ view: UIView!, _ image: String="placeholder") -> PlaceHolderView {
        let placeholder = PlaceHolderView.init(frame: CGRect.init(x: 0, y: 0, width: view.width, height: view.height))
        let source_image = UIImage(named: image)
        
        placeholder.icon.width = (source_image?.size.width)!
        placeholder.icon.height = (source_image?.size.height)!
        
        placeholder.icon.center = placeholder.center

        return placeholder
    }
}

extension PlaceHolderView: Placeholder {
}
