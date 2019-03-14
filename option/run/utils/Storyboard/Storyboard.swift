//
//  Storyboard.swift
//  VirtualCoins
//
//  Created by 任超 on 2018/4/27.
//  Copyright © 2018年 Abyss. All rights reserved.
//

import Foundation
import UIKit

/**
 * Storyboard 统一返回
 */
extension UIViewController
{
    @IBAction func back(segue: UIStoryboardSegue) {
        self.navigationController?.popViewController(animated: true)
    }
}
