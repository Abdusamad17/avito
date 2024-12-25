struct AdResult: Decodable {
    var title: String
    var actionTitle: String
    var selectedActionTitle: String
    var list: [AdDetails]
}
