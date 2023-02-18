// AstronomyViewController.swift
// Copyright © Aleksandr Dorofeev. All rights reserved.

import UIKit

/// Представление астрономического экрана
final class AstronomyViewController: UIViewController {
    // MARK: - Public properties

    var interactor: AstronomyBusinessLogic?
    var router: AstronomyRoutingLogic?

    // MARK: - Private properties

    private var astronomyTitle = String()
    private var imageData = Data()

    // MARK: - Private visual components

    private lazy var astronomyTableView: UITableView = {
        let tableView = UITableView()
        tableView.scrollsToTop = false
        tableView.dataSource = self
        tableView.delegate = self
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
        view.addSubview(astronomyTableView)
        registerCells()
        loadAstronomyInfo()
    }

    private func loadAstronomyInfo() {
        let request = AstronomyModels.InitForm.Request()
        interactor?.fetchAstronomy(request)
    }

    private func registerCells() {
        astronomyTableView.register(
            AstronomyTableViewCell.self,
            forCellReuseIdentifier: Constants.astronomyTableCellID
        )
    }

    private func createConstraintsForTableView() {
        NSLayoutConstraint.activate(
            [
                astronomyTableView.topAnchor
                    .constraint(equalTo: view.topAnchor, constant: -100),
                astronomyTableView.leadingAnchor
                    .constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                astronomyTableView.trailingAnchor
                    .constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                astronomyTableView.bottomAnchor
                    .constraint(equalTo: view.bottomAnchor, constant: -10)
            ]
        )
    }
}

// MARK: - AstronomyDisplayLogic

extension AstronomyViewController: AstronomyDisplayLogic {
    // MARK: - Public methods

    func displayAstronomy(_ viewModel: ViewModelAstronomyModel) {
        DispatchQueue.main.async {
            self.imageData = viewModel.data
            self.astronomyTitle = viewModel.title
            self.astronomyTableView.reloadData()
        }
    }
}

// MARK: - UITableViewDataSource

extension AstronomyViewController: UITableViewDataSource {
    // MARK: - Public methods

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView
            .dequeueReusableCell(
                withIdentifier: Constants.astronomyTableCellID,
                for: indexPath
            ) as? AstronomyTableViewCell
        else { return UITableViewCell() }
        cell.configure(title: astronomyTitle, data: imageData)
        return cell
    }
}

// MARK: - UITableViewDelegate

extension AstronomyViewController: UITableViewDelegate {
    // MARK: - Public methods

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        view.bounds.size.height + 10
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.routeToAstronomyDetailScreen()
    }
}
