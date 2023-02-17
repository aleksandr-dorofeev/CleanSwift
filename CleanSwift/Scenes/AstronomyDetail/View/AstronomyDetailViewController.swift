// AstronomyDetailViewController.swift
// Copyright © Aleksandr Dorofeev. All rights reserved.

import StoreKit
import UIKit

/// Представление экрана деталей о созвездии
final class AstronomyDetailViewController: UIViewController {
    // MARK: - Private Constants

    private enum Identifiers {
        static let deepLinkID = 304_006_512
    }

    // MARK: - Private enums

    private enum ButtonTag: Int {
        case firstButton = 1
        case secondButton = 2
    }

    // MARK: - Public properties

    var interactor: AstronomyDetailBusinessLogic?
    var router: AstronomyDetailRoutingLogic?

    // MARK: - Private properties

    private let buttonNames: [String] = [Constants.deepLinkButtonName, Constants.changeTextButtonName]
    private var explanation = String()

    // MARK: - Private visual components

    private lazy var astronomyDetailTableView: UITableView = {
        let tableView = UITableView()
        tableView.scrollsToTop = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = createFooter()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        createConstraintsForTableView()
    }

    // MARK: - Private methods

    private func setupUI() {
        view.addSubview(astronomyDetailTableView)
        registerCells()
        loadAstronomyDetailInfo()
    }

    func createFooter() -> UIView {
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
        let size = (view.frame.size.width - 200) / 2
        for footerButton in 0 ..< 2 {
            let button =
                UIButton(frame: CGRect(
                    x: CGFloat(footerButton) * size + (CGFloat(footerButton) + 1 * 10),
                    y: 0,
                    width: size,
                    height: size
                ))
            footer.addSubview(button)
            button.tag = footerButton + 1
            button.layer.borderColor = UIColor.black.cgColor
            button.layer.borderWidth = 0.5
            button.setTitle(buttonNames[footerButton], for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.addTarget(self, action: #selector(didTapButtonAction(_:)), for: .touchUpInside)
        }
        return footer
    }

    private func loadAstronomyDetailInfo() {
        let request = AstronomyDetailModels.InitForm.Request()
        interactor?.requestInitForm(request)
    }

    private func registerCells() {
        astronomyDetailTableView.register(
            AstronomyDetailTableViewCell.self,
            forCellReuseIdentifier: Constants.astronomyDetailTableCellID
        )
    }

    private func createConstraintsForTableView() {
        NSLayoutConstraint.activate(
            [
                astronomyDetailTableView.topAnchor
                    .constraint(equalTo: view.topAnchor),
                astronomyDetailTableView.leadingAnchor
                    .constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                astronomyDetailTableView.trailingAnchor
                    .constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                astronomyDetailTableView.bottomAnchor
                    .constraint(equalTo: view.bottomAnchor)
            ]
        )
    }

    private func deepLinking(url: URL, id: Int) {
        router?.showDeepLink(url: url, linkId: id)
    }

    @objc private func didTapButtonAction(_ sender: UIButton) {
        switch sender.tag {
        case ButtonTag.firstButton.rawValue:
            let request = AstronomyDetailModels.DeepLinking.Request(
                link: Constants.astronomyPictureLink,
                linkID: Identifiers.deepLinkID
            )
            interactor?.requestDeepLink(request)
        case ButtonTag.secondButton.rawValue:
            let request = AstronomyDetailModels.DetailChanged.Request(explanation: explanation)
            interactor?.requestDetailChanged(request)
        default:
            break
        }
    }
}

// MARK: - AstronomyDetailDisplayLogic

extension AstronomyDetailViewController: AstronomyDetailDisplayLogic {
    // MARK: - Public methods

    func displayInitForm(_ viewModel: AstronomyDetailModels.InitForm.ViewModel) {
        DispatchQueue.main.async {
            self.title = viewModel.title
            self.explanation = viewModel.explanation
            self.astronomyDetailTableView.reloadData()
        }
    }

    func displayDetailChanged(_ viewModel: AstronomyDetailModels.DetailChanged.ViewModel) {
        DispatchQueue.main.async {
            self.explanation = viewModel.explanation
            self.astronomyDetailTableView.reloadData()
        }
    }

    func displayDeepLink(_ viewModel: AstronomyDetailModels.DeepLinking.ViewModel) {
        DispatchQueue.main.async {
            self.deepLinking(url: viewModel.link, id: viewModel.linkID)
        }
    }
}

// MARK: - UITableViewDataSource

extension AstronomyDetailViewController: UITableViewDataSource {
    // MARK: - Public methods

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView
            .dequeueReusableCell(
                withIdentifier: Constants.astronomyDetailTableCellID,
                for: indexPath
            ) as? AstronomyDetailTableViewCell
        else { return UITableViewCell() }
        cell.configure(explanation: explanation)
        return cell
    }
}

// MARK: - UITableViewDelegate

extension AstronomyDetailViewController: UITableViewDelegate {
    // MARK: - Public methods

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        view.bounds.size.height / 2
    }
}
