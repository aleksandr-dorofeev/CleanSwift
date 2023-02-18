// AstronomyTableViewCell.swift
// Copyright © Aleksandr Dorofeev. All rights reserved.

import UIKit

/// Ячейка с мемом
final class AstronomyTableViewCell: UITableViewCell {
    // MARK: - Private Visual Components

    private let astronomyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let astronomyTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.arialFont, size: 20)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .white
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

    func configure(title: String, data: Data) {
        DispatchQueue.main.async {
            self.astronomyImageView.image = UIImage(data: data)
        }
        astronomyTitleLabel.text = title
    }

    // MARK: - Private methods

    private func setupUI() {
        selectionStyle = .none
        contentView.addSubview(astronomyImageView)
        astronomyImageView.addSubview(astronomyTitleLabel)
        setUpConstraintsForContainer()
        setUpConstraintsForAstronomyTitle()
    }

    private func setUpConstraintsForContainer() {
        NSLayoutConstraint.activate(
            [
                astronomyImageView.topAnchor
                    .constraint(equalTo: topAnchor),
                astronomyImageView.bottomAnchor
                    .constraint(equalTo: bottomAnchor),
                astronomyImageView.leadingAnchor
                    .constraint(equalTo: leadingAnchor),
                astronomyImageView.trailingAnchor
                    .constraint(equalTo: trailingAnchor)
            ]
        )
    }

    private func setUpConstraintsForAstronomyTitle() {
        NSLayoutConstraint.activate(
            [
                astronomyTitleLabel.centerYAnchor
                    .constraint(equalTo: astronomyImageView.centerYAnchor),
                astronomyTitleLabel.centerXAnchor
                    .constraint(equalTo: astronomyImageView.centerXAnchor),
                astronomyTitleLabel.trailingAnchor
                    .constraint(equalTo: astronomyImageView.trailingAnchor, constant: -10),
                astronomyTitleLabel.leadingAnchor
                    .constraint(equalTo: astronomyImageView.leadingAnchor, constant: 10),
                astronomyTitleLabel.heightAnchor
                    .constraint(equalToConstant: 100)
            ]
        )
    }
}
