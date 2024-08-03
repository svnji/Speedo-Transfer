import UIKit

class MoreViewController: UIViewController {
    @IBOutlet weak var moreView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradientBackground()

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
    }
    @IBAction func profileBtnTapped(_ sender: Any) {
    }
    @IBAction func helpBtnTapped(_ sender: Any) {
    }
    @IBAction func logoutBtnTapped(_ sender: Any) {
    }
    
}


