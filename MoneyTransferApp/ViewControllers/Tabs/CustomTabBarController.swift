import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
    }

    private func setupViewControllers() {
        // Get the storyboard instance
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        // Instantiate view controllers
        guard let homeVC = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController,
              let transferVC = storyboard.instantiateViewController(withIdentifier: "TransferViewController") as? TransferViewController,
              let transactionsVC = storyboard.instantiateViewController(withIdentifier: "TransactionsViewController") as? TransactionsViewController,
              let cardsVC = storyboard.instantiateViewController(withIdentifier: "CardsViewController") as? CardsViewController,
              let moreVC = storyboard.instantiateViewController(withIdentifier: "MoreViewController") as? MoreViewController else {
            print("Error: Could not instantiate view controllers")
            return
        }

        // Set tab bar items
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home 2"), tag: 0)
        transferVC.tabBarItem = UITabBarItem(title: "Transfer", image: UIImage(named: "Transfer 2"), tag: 1)
        transactionsVC.tabBarItem = UITabBarItem(title: "Transactions", image: UIImage(systemName: "list.bullet"), tag: 2)
        cardsVC.tabBarItem = UITabBarItem(title: "Cards", image: UIImage(systemName: "creditcard"), tag: 3)
        moreVC.tabBarItem = UITabBarItem(title: "More", image: UIImage(named: "More 2"), tag: 4)

        // Set the view controllers
        viewControllers = [homeVC, transferVC, transactionsVC, cardsVC, moreVC]
    }
}
