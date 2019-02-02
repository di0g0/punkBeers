import UIKit

class BeerListViewController: UITableViewController {
    let beerService = BeerServices()
    
    var beerVMs:[BeerViewModel] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        setupNavBar()
        updateBeers()
    }
    
    private func setupNavBar() {
        self.title = Constants.appTitle
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(updateBeers))
    }
    
    @objc func updateBeers() {
        showLoading()
        self.beerService.getBeers {[weak self] (error, beers) in
            guard let strongSelf = self else { return }
            strongSelf.hideLoading()
            if let error = error {
                strongSelf.showMessage(error.localizedDescription)
                return
            }
            strongSelf.beerVMs = beers
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.showBeerDetailSegue,
            let indexPath = tableView.indexPathForSelectedRow,
            let controller = segue.destination as? DetailViewController {
            controller.beer = beerVMs[indexPath.row]
            self.tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return BeerListCell.cellHeight
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beerVMs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BeerListCell.cellReuseIdentifier, for: indexPath) as? BeerListCell else {
            return UITableViewCell()
        }
        let beerViewModel = beerVMs[indexPath.row]
        cell.fill(with: beerViewModel)
        return cell
    }
}
