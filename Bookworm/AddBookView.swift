import SwiftUI

struct AddBookView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) var moc
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = ""
    @State private var review = ""
    
    private let genres: [String] = ["Action", "Adventure", "Fantasy", "Historical", "Mystery", "Romance", "Science Fiction", "Thriller"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Title", text: $title)
                    TextField("Author", text: $author)
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                Section {
                    TextEditor(text: $review)
                    
                    Picker("Rating", selection: $rating) {
                        ForEach(0..<6) {
                            Text(String($0))
                        }
                    }
                } header: {
                    Text("Write a review")
                }
                
                Section {
                    Button("Add") {
                        let book = Book(context: self.moc)
                        book.id = UUID()
                        book.title = self.title
                        book.author = self.author
                        book.genre = self.genre
                        book.review = self.review
                        book.rating = Int64(self.rating)
                        
                        try? self.moc.save()
                        self.dismiss()
                    }
                }
            }
            .navigationTitle("Add Book")
        }
    }
}
