//
//  UIAlertAction+UIAlertController+Extension.swift
//  Square
//
//  Created by minjuniMac on 01/11/2018.
//  Copyright © 2018 mjun. All rights reserved.
//
import UIKit

extension UIAlertAction {
    convenience init(title: String?, preferredStyle: UIAlertAction.Style, Index: Int, tapBlock:((UIAlertAction, Int) -> Void)?) {
        self.init(title: title, style: preferredStyle) { (action: UIAlertAction) in
            if let block = tapBlock {
                block(action, Index)
            }
        }
    }
}

extension UIAlertController {
    convenience init(title: String?, message: String?, preferredStyle: UIAlertController.Style, actions: [ActionType], tapBlock:((UIAlertAction,Int) -> Void)?) {
        self.init(title: title, message: message, preferredStyle: preferredStyle)
        for (index, alertActionType) in actions.enumerated() {
            let action = UIAlertAction(title: alertActionType.message,
                                       preferredStyle: alertActionType.style,
                                       Index: index,
                                       tapBlock: tapBlock)
            self.addAction(action)
        }
    }
}

