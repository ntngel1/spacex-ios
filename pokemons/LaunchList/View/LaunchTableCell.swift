//
// Created by TK_user on 04.03.2020.
// Copyright (c) 2020 Kirill Shepelev. All rights reserved.
//

import UIKit
import Kingfisher

class LaunchTableCell: UITableViewCell {
    
    let patchImageView = UIImageView()
    let titleLabel = UILabel()
    let launchNumberLabel = UILabel()
    let launchDateLabel = UILabel()

    override init(style: CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: LaunchViewModel) {
        patchImageView.kf.setImage(with: URL(string: viewModel.patchUrl))
        titleLabel.text = viewModel.title
        launchNumberLabel.text = viewModel.flightNumber
        launchDateLabel.text = viewModel.launchDate
    }

    private func setupLayout() {
        contentView.addSubview(patchImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(launchNumberLabel)
        contentView.addSubview(launchDateLabel)

        patchImageView.snp.makeConstraints({
            $0.leading.equalTo(contentView.snp.leading).offset(16)
            $0.centerY.equalTo(contentView.snp.centerY)
            $0.width.equalTo(60)
            $0.height.equalTo(60)
        })
        
        titleLabel.snp.makeConstraints({
            $0.leading.equalTo(patchImageView.snp.trailing).offset(12)
            $0.trailing.equalTo(contentView.snp.trailing).offset(-16)
            $0.top.equalTo(contentView.snp.top).offset(16)
        })

        launchNumberLabel.snp.makeConstraints({
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.trailing.equalTo(titleLabel.snp.trailing)
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
        })

        launchDateLabel.snp.makeConstraints({
            $0.leading.equalTo(launchNumberLabel.snp.leading)
            $0.trailing.equalTo(launchNumberLabel.snp.trailing)
            $0.top.equalTo(launchNumberLabel.snp.bottom).offset(7)
            $0.bottom.equalTo(contentView.snp.bottom).offset(-16)
        })
    }

    private func setupViews() {
        patchImageView.contentMode = .scaleAspectFit
        patchImageView.clipsToBounds = true
        
        titleLabel.font = titleLabel.font.withSize(16.0)
        titleLabel.numberOfLines = 1

        launchNumberLabel.font = launchNumberLabel.font.withSize(14.0)
        launchNumberLabel.textColor = UIColor(red: 0.51, green: 0.69, blue: 0.96, alpha: 1.0)
        launchNumberLabel.numberOfLines = 1

        launchDateLabel.font = launchNumberLabel.font.withSize(14.0)
        launchDateLabel.textColor = UIColor(red: 0.51, green: 0.69, blue: 0.96, alpha: 1.0)
        launchDateLabel.numberOfLines = 1
    }
}
