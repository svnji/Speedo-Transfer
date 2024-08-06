import UIKit

class MoreViewController: UIViewController {
    @IBOutlet weak var moreView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradientBackground()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

    }
    private func setupGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = moreView.bounds
        if let MainViewColor = UIColor(named: "MainViewColor") {
            gradientLayer.colors = [MainViewColor.cgColor, UIColor.red.cgColor]
        } else {
            gradientLayer.colors = [UIColor.systemPink.cgColor, UIColor.red.cgColor]
        }
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 10.0)
        moreView.layer.insertSublayer(gradientLayer, at: 0)
    }
    @IBAction func transferFromWebsiteBtnTapped(_ sender: Any) {
    }
    @IBAction func favouritesBtnTapped(_ sender: Any) {
        let sb = UIStoryboard(name: StoryBoards.main, bundle: nil)
        let favouritViewController = sb.instantiateViewController(withIdentifier: VCs.favouritViewController) as! FavouritViewController
        self.navigationController?.pushViewController(favouritViewController, animated: true)
    }
    @IBAction func profileBtnTapped(_ sender: Any) {
        let sb = UIStoryboard(name: StoryBoards.main, bundle: nil)
        let profileViewController = sb.instantiateViewController(withIdentifier: VCs.profileViewController) as! ProfileViewController
        self.navigationController?.pushViewController(profileViewController, animated: true)
    }
    @IBAction func helpBtnTapped(_ sender: Any) {
    }
    @IBAction func logoutBtnTapped(_ sender: Any) {
    }
    
}



