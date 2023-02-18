// AstronomyDetailTableViewCell.swift
// Copyright © Aleksandr Dorofeev. All rights reserved.

import UIKit

/// Ячейка с деталями о созвездии
final class AstronomyDetailTableViewCell: UITableViewCell {
    // MARK: - Private Visual Components

    private let containerView: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let astronomyExplanationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.arialFont, size: 13)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .black
        label.sizeToFit()
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - Public methods

    func configure(explanation: String) {
        astronomyExplanationLabel.text = explanation
    }

    // MARK: - Private methods

    private func setupUI() {
        selectionStyle = .none
        contentView.addSubview(containerView)
        containerView.addSubview(astronomyExplanationLabel)
        setUpConstraintsContainer()
        setupConstraintsExplanation()
    }

    private func setUpConstraintsContainer() {
        NSLayoutConstraint.activate(
            [
                containerView.topAnchor
                    .constraint(equalTo: topAnchor),
                containerView.bottomAnchor
                    .constraint(equalTo: bottomAnchor),
                containerView.leadingAnchor
                    .constraint(equalTo: leadingAnchor),
                containerView.trailingAnchor
                    .constraint(equalTo: trailingAnchor)
            ]
        )
    }

    private func setupConstraintsExplanation() {
        NSLayoutConstraint.activate(
            [
                astronomyExplanationLabel.topAnchor
                    .constraint(equalTo: containerView.topAnchor, constant: 5),
                astronomyExplanationLabel.bottomAnchor
                    .constraint(equalTo: containerView.bottomAnchor, constant: -5),
                astronomyExplanationLabel.leadingAnchor
                    .constraint(equalTo: containerView.leadingAnchor, constant: 5),
                astronomyExplanationLabel.trailingAnchor
                    .constraint(equalTo: containerView.trailingAnchor, constant: -5)
            ]
        )
    }
}
