//
// Created by TK_user on 05.03.2020.
// Copyright (c) 2020 Kirill Shepelev. All rights reserved.
//

class LaunchListPresenter {

    weak var view: LaunchListView?

    var fetchLaunchesInteractor: FetchLaunchesInteractorInput?
}

extension LaunchListPresenter: LaunchListViewOutput {

    func viewLoaded() {
        view?.set(state: .loading)
        fetchLaunchesInteractor?.refresh()
    }

    func onLoadNextLaunchesPage() {
        view?.set(state: .loading)
        fetchLaunchesInteractor?.fetchNextLaunchesPage()
    }
}

extension LaunchListPresenter: FetchLaunchesInteractorOutput {

    func set(launches: [LaunchEntity]) {
        let viewModels: [LaunchViewModel] = launches.map({ launch in
            LaunchViewModel(
                    title: launch.missionName,
                    launchDate: launch.launchDateLocal,
                    flightNumber: String(launch.flightNumber),
                    patchUrl: launch.links?.missionPatchSmall ?? ""
            )
        })

        view?.set(state: .data(viewModels))
    }
}
