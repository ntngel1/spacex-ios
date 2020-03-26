//
// Created by TK_user on 04.03.2020.
// Copyright (c) 2020 Kirill Shepelev. All rights reserved.
//

import Foundation

protocol LaunchListViewInput {
    func set(state: PokemonListViewState)
}

protocol LaunchListViewOutput {
    func viewLoaded()
    func onLoadNextLaunchesPage()
}

protocol LaunchListView: LaunchListViewInput, AnyObject {
    var output: LaunchListViewOutput? { get set }
}

enum PokemonListViewState {
    case data([LaunchViewModel])
    case error(NSError)
    case loading
}