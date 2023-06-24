function printBooks(books) {
  for (let i = 0; i < books.length; i++) {
    console.log("『" + books[i].title + "』" + books[i].author)
  }
}

books = [
  {
    title: "JavaScript入門",
    author: "山田太郎"
  },
  {
    title: "JavaScriptの絵本",
    author: "山田次郎"
  }
]

printBooks(books)
