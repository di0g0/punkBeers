import UIKit
import SDWebImage

class BeerListCell : UITableViewCell {
    static let cellHeight: CGFloat = 90.0
    static let cellReuseIdentifier = "BeerListCellIdentifier"
    
    @IBOutlet weak var beerNameLabel: UILabel!
    @IBOutlet weak var abvLabel: UILabel!
    @IBOutlet weak var beerPicture: UIImageView!
    
    override func prepareForReuse() {
        abvLabel.text = ""
        beerPicture.image = nil
        beerNameLabel.text = ""
    }
    
    func fill(with beerViewModel: BeerViewModel) {
        self.beerNameLabel.text = beerViewModel.nameText
        self.abvLabel.text = beerViewModel.abvText
        self.beerPicture.sd_setImage(with: beerViewModel.pictureUrl)
    }
}
