//
// Created by TK_user on 05.03.2020.
// Copyright (c) 2020 Kirill Shepelev. All rights reserved.
//

import RxSwift

class FetchLaunchesInteractorImp: FetchLaunchesInteractorInput {

    private var launchRepository: LaunchRepository
    private weak var presenter: FetchLaunchesInteractorOutput?

    private var currentLaunches: [LaunchEntity] = []

    private var fetchDisposable: Disposable? = nil
    private var isLoadedAllLaunches = false
    private var currentPage = 0
    private let LIMIT = 10

    private var isLoading: Bool {
        fetchDisposable != nil
    }

    required init(presenter: FetchLaunchesInteractorOutput, launchRepository: LaunchRepository) {
        self.launchRepository = launchRepository
        self.presenter = presenter
    }

    func fetchNextLaunchesPage() {
        if isLoading || isLoadedAllLaunches {
            return
        }

        fetchDisposable = launchRepository.getLaunches(for: currentPage, with: LIMIT)
                .do(finally: {
                    self.fetchDisposable = nil
                })
                .subscribe(onNext: { launches in
                    if !launches.isEmpty {
                        self.currentLaunches.append(contentsOf: launches)
                        self.currentPage += 1
                        self.presenter?.set(launches: self.currentLaunches)
                    } else {
                        self.isLoadedAllLaunches = true
                    }
                }, onError: { error in
                    print(error)
                    // TODO Send error to presenter
                })
    }

    func refresh() {
        fetchDisposable?.dispose()
        fetchDisposable = nil
        currentPage = 0
        fetchNextLaunchesPage()
    }
}
