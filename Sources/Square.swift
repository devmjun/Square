//
//  Square.swift
//  Square
//
//  Created by minjuniMac on 01/11/2018.
//  Copyright © 2018 mjun. All rights reserved.
//
import UIKit

public enum ActionType {
    case `default`(message: String)
    case cancel(message: String)
    case destructive(message: String)
    
    var style: UIAlertAction.Style {
        switch self {
        case .default(_ ):     return .default
        case .cancel(_ ):      return .cancel
        case .destructive(_ ): return .destructive
        }
    }
    
    var message: String {
        switch self {
        case .default(let message):     return message
        case .cancel(let message):      return message
        case .destructive(let message): return message
        }
    }
}

@objc open class Square: NSObject {
    static var shared: Square {
        return Square()
    }
    
    private func topController() -> UIViewController {
        var presentedVC = UIApplication.shared.keyWindow?.rootViewController
        while let _presnetedVC = presentedVC?.presentedViewController {
            presentedVC = _presnetedVC
        }
        
        guard let presented = presentedVC else {
            fatalError("Error: You don't have any views set")
        }
        
        return presented
    }
}


extension Square {
    /**
     Displaying only title with UIAlertController
     */
    @discardableResult
    open class func display(_ title: String) -> UIAlertController {
        return display(title, message: nil)
    }
    /**
     Displaying title and message with UIAlertController
     */
    @discardableResult
    open class func display(_ title: String?, message: String?) -> UIAlertController {
        return display(title, message: message, alertAction: .default(message: "OK"), acceptBlock: {
            // Do nothing
        })
    }
    
    /**
     Displaying single alert action
     
     - Parameter title: Title with UIAlertController
     - Parameter message: Message with UIAlertController
     - Parameter alertAction: ActionType is mapped `UIAlertAction.Style` and UIAlertAction's title
     - Parameter preferredStyle: Default value of this that is UIAlertController's Style(alert, actionSheet) is `.alert`
     - Parameter acceptBlock: UIAlertAction's handler
     
     ```
     Square.display("Some Title", message: "Some Message", alertAction: .default("Some Alert Action Title") {
     // Do something
     }
     ```
     */
    @discardableResult
    open class func display(_ title: String?,
                            message: String?,
                            alertAction: ActionType,
                            preferredStyle: UIAlertController.Style = .alert,
                            acceptBlock: @escaping () -> ()) -> UIAlertController {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        let acceptAction = UIAlertAction(title: alertAction.message, style: alertAction.style) { _ in acceptBlock() }
        alertController.addAction(acceptAction)
        shared.topController().present(alertController, animated: true, completion: nil)
        return alertController
    }
}

extension Square {
    /**
     Displaying multiple alert action
     
     - Parameter title: Title with UIAlertController
     - Parameter message: Message with UIAlertController
     - Parameter alertActions: ActionType is mapped `UIAlertAction.Style` and UIAlertAction's title
     - Parameter preferredStyle: Default value of this that is UIAlertController's Style(alert, actionSheet) is `.alert`
     - Parameter acceptBlock: UIAlertAction's handler
     
     ```
     Square.display("Some Title", message: "Some Message", alertActions: [.default("Some Alert Action Title", .cancel("Some Alert Action Title")]) {
     // Do something
     }
     ```
     */
    @discardableResult
    open class func display(_ title: String?,
                            message: String?,
                            alertActions: [ActionType],
                            preferredStyle: UIAlertController.Style = .alert,
                            tapBlock: ( (UIAlertAction, Int) -> Void)? ) -> UIAlertController {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: preferredStyle,
                                                actions: alertActions,
                                                tapBlock: tapBlock)
        shared.topController().present(alertController, animated: true, completion: nil)
        return alertController
    }
}

// For ActionSheet
extension Square {
    @discardableResult
    open class func displayActionSheet(_ title: String, message: String, sourceView: UIView, alertAction: ActionType, acceptBlock: @escaping () -> ()) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        let acceptAction = UIAlertAction(title: alertAction.message, style: alertAction.style) { _ in acceptBlock() }
        alertController.addAction(acceptAction)
        
        alertController.popoverPresentationController?.sourceView = sourceView
        alertController.popoverPresentationController?.sourceRect = sourceView.bounds
        shared.topController().present(alertController, animated: true, completion: nil)
        return alertController
    }
    
    @discardableResult
    open class func displayActionSheet(_ title: String?,
                                       message: String?,
                                       sourceView: UIView,
                                       alertActions: [ActionType],
                                       tabBlock: ((UIAlertAction, Int) -> Void)? ) -> UIAlertController {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .actionSheet,
                                                actions: alertActions,
                                                tapBlock: tabBlock)
        alertController.popoverPresentationController?.sourceView = sourceView
        alertController.popoverPresentationController?.sourceRect = sourceView.bounds
        shared.topController().present(alertController, animated: true, completion: nil)
        return alertController
    }
}

