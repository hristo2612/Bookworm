import SwiftUI

struct EmojiRatingView: View {
    var rating: Int64
    
    var body: some View {
        switch rating {
        case 0:
            Text("🤮")
        case 1:
            Text("😕")
        case 2:
            Text("🫤")
        case 3:
            Text("😐")
        case 4:
            Text("😊")
        case 5:
            Text("🤩")
        default:
            Text("😐")
        }
    }
}
