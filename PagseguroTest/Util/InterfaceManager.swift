import UIKit
class InterfaceManager {
    static func initialize() {
        setupAppearance()
    }
    
    private static func setupAppearance() {
        UINavigationBar.appearance().configureForBeerStyle()
    }
}

