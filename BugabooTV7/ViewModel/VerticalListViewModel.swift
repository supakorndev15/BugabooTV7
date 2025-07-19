
import Foundation

class VerticalListViewModel {
    private var items: [VerticalModel] = verticalMockData // API

    func numberOfItems() -> Int {
        return items.count
    }

    func viewModel(at index: Int) -> VerticalCellViewModel {
        return VerticalCellViewModel(model: items[index])
    }
}

let verticalMockData = [
    VerticalModel(coverImage: "verti_highlight_1", name: "TV CH7", categoryTags: "TV CH7"),
    VerticalModel(coverImage: "verti_highlight_2", name: "TV CH7", categoryTags: "TV CH7"),
    VerticalModel(coverImage: "verti_highlight_3", name: "TV CH7", categoryTags: "TV CH7"),
    VerticalModel(coverImage: "verti_highlight_4", name: "TV CH7", categoryTags: "TV CH7"),
    VerticalModel(coverImage: "verti_highlight_5", name: "TV CH7", categoryTags: "TV CH7"),
    VerticalModel(coverImage: "verti_highlight_6", name: "TV CH7", categoryTags: "TV CH7"),
    VerticalModel(coverImage: "verti_highlight_7", name: "TV CH7", categoryTags: "TV CH7"),
    VerticalModel(coverImage: "verti_highlight_8", name: "TV CH7", categoryTags: "TV CH7"),
    VerticalModel(coverImage: "verti_highlight_9", name: "TV CH7", categoryTags: "TV CH7"),
    VerticalModel(coverImage: "verti_highlight_10", name: "TV CH7", categoryTags: "TV CH7")
]

