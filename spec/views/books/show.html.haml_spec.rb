require "spec_helper"

describe "books/show.html.haml" do
  it "displays the book page" do
    assign(:book, stub_model(Book, title: 'show test title', description: 'show desc'))

    # controller.extra_params = { id: book.id }

    render

    expect(rendered).to have_content('show test title')
    expect(rendered).to have_content('show desc')
    expect(rendered).to have_link('Back', href: root_path)
    expect(rendered).to have_link('Edit', href: edit_book_path)
    expect(rendered).to have_link('Delete', href: book_path)
  end

  describe "books/show" do
    it "displays the book with id: 1" do
      book = Book.create!(title: 'show test title', description: 'show desc')
      controller.extra_params = { id: book.id }

      expect(controller.request.fullpath).to eq book_path(book)
    end
  end
end