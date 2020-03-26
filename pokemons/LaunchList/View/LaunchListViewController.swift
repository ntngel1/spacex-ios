//
//  LaunchListViewController.swift
//  pokemons
//
//  Created by TK_user on 03.03.2020.
//  Copyright © 2020 Kirill Shepelev. All rights reserved.
//

import UIKit
import RxSwift
import Kingfisher
import SnapKit

class LaunchListViewController: UIViewController, LaunchListView {

    var output: LaunchListViewOutput? = nil

    private let launchTableView = LaunchTableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "Space X"
        self.navigationController?.navigationBar.prefersLargeTitles = true

        view.addSubview(launchTableView)
        launchTableView.snp.makeConstraints({
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
        })

        LaunchListConfiguratorImp().configure(view: self)
        output?.viewLoaded()
    }

    func set(state: PokemonListViewState) {
        switch state {
        case .data(let viewModels):
            launchTableView.set(viewModels: viewModels)
        case .error(_):
            break
        case .loading:
            break
        }
    }
}

extension LaunchListViewController: LaunchTableViewDelegate {

    func onLoadNextLaunchesPage() {
        output?.onLoadNextLaunchesPage()
    }
}
