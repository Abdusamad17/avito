import UIKit
import Foundation

protocol InteractorInput {
    var output: InteractorOutput? { get set }
    func getInformation() -> Information?
}

protocol InteractorOutput: AnyObject {
    func sendInformation() -> Information?
}

final class Interactor: InteractorInput {
    weak var output: InteractorOutput?
    
    func getInformation() -> Information? {
        let urlString =  "https://vk.com"
        
        guard let url = URL(string: urlString) else { return Information(status: "status0",
                                                                         result: Result(title: "title0",
                                                                                        actionTitle: "actionTitle0",
                                                                                        selectedActionTitle: "selectedActionTitle0",
                                                                                        list: [CellData(id: "id00",
                                                                                                        title: "title00",
                                                                                                        description: "description00",
                                                                                                        icon: Icon(x52: "highlight"),
                                                                                                        price: "price00",
                                                                                                        isSelected: false)]))}
        
        var returnValue: Information?
        
        URLSession.shared.dataTask(with: url){data, response, error in
            if let error = error {
                print("Error error!")
                print(error)
                return
            }
            guard let data = data else {
                print("Data error!")
                return
            }
            
            let jsonSttring: String? = String(data: data, encoding: .utf8)
            print(jsonSttring ?? "JsonSttring error!")
            do {
                let dannie = try JSONDecoder().decode(Information.self, from: data)
                returnValue = dannie
            } catch {
                print(error)
            }
            
        }.resume()
        
        return returnValue
    }
}
