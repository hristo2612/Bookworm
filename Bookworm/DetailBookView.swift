import SwiftUI

struct DetailBookView: View {
    var book: Book
    
    var body: some View {
        VStack {
            Text(book.title ?? "Unknown")
                .font(.headline)
            Text(book.author ?? "Unknown")
                .font(.subheadline)
                .foregroundStyle(.secondary)
            EmojiRatingView(rating: book.rating)
                .font(.headline)
            Text(book.review ?? "No Review")
            Text(book.genre ?? "Unknown")
        }
    }
}
