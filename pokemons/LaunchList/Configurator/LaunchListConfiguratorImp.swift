//
// Created by TK_user on 05.03.2020.
// Copyright (c) 2020 Kirill Shepelev. All rights reserved.
//

class LaunchListConfiguratorImp: LaunchListConfigurator {

    func configure(view: LaunchListView) {
        let presenter = LaunchListPresenter()
        let launchRepository = AlamofireLaunchRepository()
        let fetchLaunchesInteractor = FetchLaunchesInteractorImp(
                presenter: presenter,
                launchRepository: launchRepository
        )

        presenter.fetchLaunchesInteractor = fetchLaunchesInteractor
        presenter.view = view
        view.output = presenter
    }
}