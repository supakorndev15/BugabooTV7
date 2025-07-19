import Foundation

class HorizontalListViewModel {
    private var items: [HorizontalModel] = horizontalMockData

    func numberOfItems() -> Int {
        return items.count
    }

    func viewModel(at index: Int) -> HorizontalCellViewModel {
        return HorizontalCellViewModel(model: items[index])
    }
}

let horizontalMockData = [
    HorizontalModel(coverImage: "highlight_1", name: "TV CH7", categoryTags: "TV CH7highlight_1"),
    HorizontalModel(coverImage: "highlight_2", name: "TV CH7", categoryTags: "TV CH7highlight_1"),
    HorizontalModel(coverImage: "highlight_3", name: "TV CH7", categoryTags: "TV CH7"),
    HorizontalModel(coverImage: "highlight_4", name: "TV CH7", categoryTags: "TV CH7"),
    HorizontalModel(coverImage: "highlight_1", name: "TV CH7", categoryTags: "TV CH7"),
    HorizontalModel(coverImage: "highlight_2", name: "TV CH7", categoryTags: "TV CH7"),
    HorizontalModel(coverImage: "highlight_3", name: "TV CH7", categoryTags: "TV CH7highlight_1"),
    HorizontalModel(coverImage: "highlight_4", name: "TV CH7", categoryTags: "TV CH7"),
    HorizontalModel(coverImage: "highlight_1", name: "TV CH7", categoryTags: "TV CH7"),
    HorizontalModel(coverImage: "highlight_2", name: "TV CH7", categoryTags: "TV CH7")
]
