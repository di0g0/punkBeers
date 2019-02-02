import UIKit
extension UINavigationBar {
    func configureForBeerStyle() {
        self.isTranslucent = false
        self.tintColor = .black
        self.barTintColor = .punkBlue
        self.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.black,
             NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .medium)]
    }
}
