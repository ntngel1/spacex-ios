//
// Created by TK_user on 05.03.2020.
// Copyright (c) 2020 Kirill Shepelev. All rights reserved.
//

import RxSwift

protocol FetchLaunchesInteractorInput {
    func fetchNextLaunchesPage()
    func refresh()
}

protocol FetchLaunchesInteractorOutput: AnyObject {
    func set(launches: [LaunchEntity])
}