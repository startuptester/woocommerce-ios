
import Foundation
import UIKit

protocol FilterListViewModel {
    // TODO This can be BehaviorSubject<[FilterListCellViewModel]>
    var cellViewModels: [FilterListCellViewModel] { get }
}

struct FilterListCellViewModel: Equatable {
    let title: String
    let value: String
}

final class FilterListViewController2<ViewModel: FilterListViewModel>: UIViewController {
    @IBOutlet private weak var navigationControllerContainerView: UIView!
    @IBOutlet private weak var filterActionContainerView: UIView!

    private let viewModel: ViewModel

    private lazy var listSelectorViewController: ListSelectorViewController<FilterListCommand, FilterListCommand.Model, FilterListCommand.Cell> = {
        let command = FilterListCommand(data: viewModel.cellViewModels)
        return ListSelectorViewController(command: command, onDismiss: { selected in

        })
    }()

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

private extension FilterListViewController2 {
    final class FilterListCommand: ListSelectorCommand {
        typealias Cell = SettingTitleAndValueTableViewCell
        typealias Model = FilterListCellViewModel

        // TODO Implement
        let navigationBarTitle: String? = "Filters"
        // TODO Implement
        let selected: FilterListCellViewModel? = nil

        let data: [FilterListCellViewModel]

        init(data: [FilterListCellViewModel]) {
            self.data = data
        }

        func isSelected(model: FilterListCellViewModel) -> Bool {
            selected == model
        }

        func handleSelectedChange(selected: FilterListCellViewModel, viewController: ViewController) {

        }

        func configureCell(cell: SettingTitleAndValueTableViewCell, model: FilterListCellViewModel) {
            cell.selectionStyle = .default
            cell.updateUI(title: model.title, value: model.value)
        }
    }
}

// MARK: - Products Specific

final class ProductFilterListViewModel: FilterListViewModel {
    let cellViewModels: [FilterListCellViewModel] = [
        FilterListCellViewModel(title: "Stock status", value: "Any"),
        FilterListCellViewModel(title: "Product status", value: "Any"),
        FilterListCellViewModel(title: "Product type", value: "Any"),
    ]
}
