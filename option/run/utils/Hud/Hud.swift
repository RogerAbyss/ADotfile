//
//  Hud.swift
//  VirtualCoins
//
//  Created by 任超 on 2018/4/26.
//  Copyright © 2018年 Abyss. All rights reserved.
//

import MBProgressHUD
import Foundation

/**
 * first of all, you need add asserts to project
 */
class Hud: NSObject {
    enum HudType {
        case success
        case info
        case error
        case warning
    }

    /**
    * show message
    */
    class func show(type: HudType, text: String) {
        if let window = UIApplication.shared.delegate?.window {
            var image: UIImage
            switch type {
            case .success:
                image = #imageLiteral(resourceName: "Alert_success")
            case .info:
                image = #imageLiteral(resourceName: "Alert_info")
            case .error:
                image = #imageLiteral(resourceName: "Alert_error")
            case .warning:
                image = #imageLiteral(resourceName: "Alert_warning")
            }
            let hud = MBProgressHUD.showAdded(to: window!, animated: true)
            hud.backgroundColor = UIColor.gray.withAlphaComponent(0.2)
            hud.mode = .customView
            hud.customView = UIImageView(image:image)
            hud.label.text = text
            hud.hide(animated: true, afterDelay: 1.2)
        }
    }
    
    /**
    * show loading
    */
    class func show() {
        if let window = UIApplication.shared.delegate?.window {
            MBProgressHUD.showAdded(to: window!, animated: true)
        }
    }

    /**
    * pop loading
    */
    class func hide() {
        if let window = UIApplication.shared.delegate?.window {
            MBProgressHUD.hide(for: window!, animated: true)
        }
    }
}

