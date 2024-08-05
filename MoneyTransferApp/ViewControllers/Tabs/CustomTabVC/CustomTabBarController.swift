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

        // Create navigation controllers
        let homeNav = UINavigationController(rootViewController: homeVC)
        let transferNav = UINavigationController(rootViewController: transferVC)
        let transactionsNav = UINavigationController(rootViewController: transactionsVC)
        let cardsNav = UINavigationController(rootViewController: cardsVC)
        let moreNav = UINavigationController(rootViewController: moreVC)

        // Set tab bar items on the navigation controllers
        homeNav.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home 2"), tag: 0)
        transferNav.tabBarItem = UITabBarItem(title: "Transfer", image: UIImage(named: "Transfer 2"), tag: 1)
        transactionsNav.tabBarItem = UITabBarItem(title: "Transactions", image: UIImage(systemName: "list.bullet"), tag: 2)
        cardsNav.tabBarItem = UITabBarItem(title: "Cards", image: UIImage(systemName: "creditcard"), tag: 3)
        moreNav.tabBarItem = UITabBarItem(title: "More", image: UIImage(named: "More 2"), tag: 4)

        // Set the navigation controllers as the view controllers of the tab bar
        viewControllers = [homeNav, transferNav, transactionsNav, cardsNav, moreNav]
    }
}
