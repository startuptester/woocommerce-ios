
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

    private lazy var listSelectorCommand = FilterListCommand(data: viewModel.cellViewModels)
    private lazy var listSelectorViewController: FilterListSelectorViewController = {
        ListSelectorViewController(command: listSelectorCommand, onDismiss: { selected in
            // noop
        })
    }()

    private lazy var clearAllBarButtonItem: UIBarButtonItem = {
        let title = NSLocalizedString("Clear all", comment: "Button title for clearing all filters for the list.")
        return UIBarButtonItem(title: title, style: .plain, target: self, action: #selector(clearAllButtonTapped))
    }()

    private var cancellable: ObservationToken?

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "FilterListViewController", bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        cancellable?.cancel()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureMainView()
        configureNavigation()
        configureChildNavigationController()
        observeListSelectorCommandItemSelection()
    }

    @objc private func dismissButtonTapped() {

    }

    @objc private func clearAllButtonTapped() {

    }

    private func observeListSelectorCommandItemSelection() {
        cancellable = listSelectorCommand.onItemSelected.subscribe { [weak self] selected in
            print("selected")
        }
    }

    private func configureMainView() {
        view.backgroundColor = .listBackground
    }

    private func configureNavigation() {
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

// MARK: - Main Table Implementation

private extension FilterListViewController2 {
    typealias FilterListSelectorViewController = ListSelectorViewController<FilterListCommand, FilterListCommand.Model, FilterListCommand.Cell>

    final class FilterListCommand: ListSelectorCommand {
        typealias Cell = SettingTitleAndValueTableViewCell
        typealias Model = FilterListCellViewModel

        // TODO Implement
        let navigationBarTitle: String? = "Filters"
        // TODO Implement
        let selected: FilterListCellViewModel? = nil

        let data: [FilterListCellViewModel]

        private let onItemSelectedSubject = PublishSubject<FilterListCellViewModel>()
        var onItemSelected: Observable<FilterListCellViewModel> {
            onItemSelectedSubject
        }

        init(data: [FilterListCellViewModel]) {
            self.data = data
        }

        func isSelected(model: FilterListCellViewModel) -> Bool {
            selected == model
        }

        func handleSelectedChange(selected: FilterListCellViewModel, viewController: ViewController) {
            onItemSelectedSubject.send(selected)
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
