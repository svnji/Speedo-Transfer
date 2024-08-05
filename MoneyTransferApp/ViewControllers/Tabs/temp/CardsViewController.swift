import UIKit

class CardsViewController: UIViewController {
    @IBOutlet weak var myCardsView: UIView!
    @IBOutlet weak var cardNameLabel: UILabel!
    @IBOutlet weak var cardAccountLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradientBackground()
    }
    @IBOutlet weak var cardStatue: UILabel!
    
    private func setupGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = myCardsView.bounds
        if let MainViewColor = UIColor(named: "MainViewColor") {
            gradientLayer.colors = [MainViewColor.cgColor, UIColor.red.cgColor]
        } else {
            gradientLayer.colors = [UIColor.systemPink.cgColor, UIColor.red.cgColor]
        }
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 10.0)
        myCardsView.layer.insertSublayer(gradientLayer, at: 0)
    }
    @IBAction func addNewAccountBtnTapped(_ sender: Any) {
    }
}
