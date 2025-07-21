
import Foundation
import Alamofire

class HighlightMenuViewModel {
    private(set) var menus: [MainMenuItem] = []

    func fetchHighlightMenu(completion: @escaping () -> Void) {
        let url = "https://bff-web-api.bugaboo.tv/bff-web/v1/navigation/highlight-menu?perso"

        AF.request(url, method: .get)
            .validate()
            .responseDecodable(of: HighlightMenu.self) { response in
                switch response.result {
                case .success(let result):
                    self.menus = result.data.mainMenuItem
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

    func item(at index: Int) -> MainMenuItem {
        return menus[index]
    }
}
