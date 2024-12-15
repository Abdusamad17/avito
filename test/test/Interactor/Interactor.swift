import UIKit
import Foundation

protocol InteractorInput {
    func getInformation()
    var output: InteractorOutput { get }
}

protocol InteractorOutput {
    func sendInformation() -> Information
    func didError(error: String)
}

final class Interactor {
    
}
