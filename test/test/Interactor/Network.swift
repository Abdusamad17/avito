import UIKit

class Network {
    static func fetch() -> AdResponse? {
        let urlString =  "https://vk.com"
        
        let resultDefault = AdResult(title: "title0",
                                   actionTitle: "actionTitle0",
                                   selectedActionTitle: "selectedActionTitle0",
                                   list: [AdDetails(id: "id00",
                                                   title: "title00",
                                                   description: "description00",
                                                   icon: AdIcon(x52: "highlight"),
                                                   price: "price00",
                                                   isSelected: false)])
        
        guard let url = URL(string: urlString) else {
            return AdResponse(status: "status0",
                               result: resultDefault)
        }
        
        var information: AdResponse?
        
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
                let dataJSON = try JSONDecoder().decode(AdResponse.self, from: data)
                information = dataJSON
                
            } catch {
                print(error)
            }
            
        }.resume()
        
        return information
    }
}
