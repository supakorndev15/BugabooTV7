import Foundation
import Alamofire

class BubbleMenuViewModel {
    private(set) var menus: [Menu] = []

    func fetchMenus(completion: @escaping () -> Void) {
        let url = "https://bff-web-api.bugaboo.tv/bff-web/v1/navigation/bubble-menu"

        AF.request(url, method: .get)
            .validate()
            .responseDecodable(of: BubbleMenuResponse.self) { response in
                switch response.result {
                case .success(let result):
                    self.menus = result.data.menu
                    DispatchQueue.main.async {
                        completion()
                    }
                case .failure(let error):
                    print("❌ Alamofire Error:", error)
                }
            }
    }

    func numberOfItems() -> Int {
        return menus.count
    }

    func item(at index: Int) -> Menu {
        return menus[index]
    }
}
