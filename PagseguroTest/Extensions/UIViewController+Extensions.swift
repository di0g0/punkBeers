import UIKit
import MBProgressHUD

extension UIViewController {
    func showLoading() {
        MBProgressHUD.showAdded(to: self.view, animated: true)
    }
    
    func hideLoading() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    func showLoading(text: String? = nil) {
        let progress = MBProgressHUD.showAdded(to: self.view, animated: true)
        if let text = text {
            progress.label.text = text
            progress.label.numberOfLines = 0
        }
    }    
    
    func showMessage(_ message: String) {
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.mode = .text
        hud.label.text = message
        hud.animationType = .zoom
        hud.hide(animated: true, afterDelay: 1.5)
    }
}
