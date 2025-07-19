
import Foundation

struct HorizontalCellViewModel {
    let imageName: String
    let title: String
    let subtitle: String
    
    init(model: HorizontalModel) {
        self.imageName = model.coverImage
        self.title = model.name
        self.subtitle = model.categoryTags
    }
}
