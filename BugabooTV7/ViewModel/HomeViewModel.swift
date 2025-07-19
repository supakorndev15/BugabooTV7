//
//  HomeViewModel.swift
//  BugabooTV7
//
//  Created by MacDetail on 19/7/2568 BE.
//

import Foundation

class HomeViewModel {
    var liveChannels: [Channel] = []

    func fetchLiveChannels(completion: @escaping () -> Void) {
        APIService.shared.request(endpoint: .liveChannels) { [weak self] (result: Result<LiveChannelsModel, Error>) in
            switch result {
            case .success(let data):
                self?.liveChannels = data.data.channels
                print("✅")
                completion()
            case .failure(let error):
                print("❌", error.localizedDescription)
                completion()
            }
        }
    }

    func numberOfLiveChannels() -> Int {
        return liveChannels.count
    }

    func channel(at index: Int) -> Channel? {
        guard index >= 0 && index < liveChannels.count else {
            return nil
        }
        return liveChannels[index]
    }

}
