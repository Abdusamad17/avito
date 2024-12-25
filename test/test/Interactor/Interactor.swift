import UIKit
import Foundation

protocol AdModuleInteractorInput {
    var output: AdModuleInteractorOutput? { get set }
    func load() -> AdResponse?
}

protocol AdModuleInteractorOutput: AnyObject {
    func send() -> AdResponse?
}

final class AdModuleInteractor: AdModuleInteractorInput {
    weak var output: AdModuleInteractorOutput?
    
    func load() -> AdResponse? {
        return Network.fetch()
    }
}
