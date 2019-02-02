import UIKit
import SDWebImage

class DetailViewController: UIViewController {
    @IBOutlet weak var beerDescription: UILabel!
    @IBOutlet weak var beerImage: UIImageView!
    @IBOutlet weak var beerTagline: UILabel!
    @IBOutlet weak var abvLabel: UILabel!
    @IBOutlet weak var ibuLabel: UILabel!
    
    var beer: BeerViewModel?
    
    func configureView() {
        guard let selectedBeer = beer else {
            return
        }
        
        self.title = selectedBeer.nameText
        self.beerDescription.text = selectedBeer.descriptionText
        self.beerTagline.text = selectedBeer.taglineText
        self.beerImage.sd_setImage(with: selectedBeer.pictureUrl)
        self.abvLabel.text = selectedBeer.abvText
        self.ibuLabel.text = selectedBeer.ibuText
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
}
