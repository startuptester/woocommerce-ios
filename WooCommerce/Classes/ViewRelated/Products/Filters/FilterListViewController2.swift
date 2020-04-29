
import Foundation
import UIKit

protocol FilterListViewModel {

}

final class FilterListViewController2<ViewModel: FilterListViewModel>: UIViewController {
    @IBOutlet private weak var navigationControllerContainerView: UIView!
    @IBOutlet private weak var filterActionContainerView: UIView!

    private let viewModel: ViewModel

    private lazy var listSelectorViewController = UIViewController()
    private lazy var clearAllBarButtonItem: UIBarButtonItem = {
        let title = NSLocalizedString("Clear all", comment: "Button title for clearing all filters for the list.")
        return UIBarButtonItem(title: title, style: .plain, target: self, action: #selector(clearAllButtonTapped))
    }()

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "FilterListViewController", bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureMainView()
        configureNavigation()
        configureChildNavigationController()
    }

    @objc private func dismissButtonTapped() {

    }

    @objc private func clearAllButtonTapped() {

    }

    private func configureMainView() {
        view.backgroundColor = .listBackground
    }

    func configureNavigation() {
        let dismissButtonTitle = NSLocalizedString("Dismiss", comment: "Button title for dismissing filtering a list.")
        listSelectorViewController.navigationItem.leftBarButtonItem = UIBarButtonItem(title: dismissButtonTitle,
                                                                                      style: .plain,
                                                                                      target: self,
                                                                                      action: #selector(dismissButtonTapped))

        listSelectorViewController.navigationItem.rightBarButtonItem = clearAllBarButtonItem

        // Disables interactive dismiss action so that we can prompt the discard changes alert.
        if #available(iOS 13.0, *) {
            isModalInPresentation = true
        }

        listSelectorViewController.removeNavigationBackBarButtonText()
    }

    private func configureChildNavigationController() {
        let navigationController = UINavigationController(rootViewController: listSelectorViewController)
        addChild(navigationController)
        navigationControllerContainerView.addSubview(navigationController.view)
        navigationController.didMove(toParent: self)

        navigationController.view.translatesAutoresizingMaskIntoConstraints = false
        navigationControllerContainerView.pinSubviewToAllEdges(navigationController.view)
    }
}

final class ProductFilterListViewModel: FilterListViewModel {

}
