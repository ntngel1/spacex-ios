//
// Created by TK_user on 04.03.2020.
// Copyright (c) 2020 Kirill Shepelev. All rights reserved.
//

import UIKit
import SnapKit

protocol LaunchTableViewDelegate {
    func onLoadNextLaunchesPage()
}

class LaunchTableView: UIView {

    var delegate: LaunchTableViewDelegate? = nil

    private static let cell = "LaunchCell"

    private let tableView = UITableView()
    private var currentViewModels: [LaunchViewModel] = []

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        setupBehavior()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(viewModels: [LaunchViewModel]) {
        if currentViewModels.count == 0 {
            self.currentViewModels.append(contentsOf: viewModels)
            tableView.reloadData()
        } else {
            let newViewModelsCount = viewModels.count - currentViewModels.count
            let startIndex = self.currentViewModels.count
            let endIndex = startIndex + newViewModelsCount

            let indexPaths = (startIndex..<endIndex).map({ IndexPath(row: $0, section: 0) })

            self.currentViewModels.append(contentsOf: viewModels[startIndex..<endIndex])

            tableView.beginUpdates()
            tableView.insertRows(at: indexPaths, with: .automatic)
            tableView.endUpdates()
        }
    }

    private func setupBehavior() {
        tableView.register(LaunchTableCell.self, forCellReuseIdentifier: LaunchTableView.cell)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 92.0
    }

    private func setupLayout() {
        addSubview(tableView)
        
        tableView.snp.makeConstraints({
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
        })
    }
}

extension LaunchTableView: UITableViewDataSource {

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LaunchTableView.cell) as! LaunchTableCell
        let viewModel = currentViewModels[indexPath.row]

        cell.configure(with: viewModel)
        return cell
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        currentViewModels.count
    }
}

extension LaunchTableView: UITableViewDelegate {

    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row >= currentViewModels.count {
            delegate?.onLoadNextLaunchesPage()
        }
    }
}
