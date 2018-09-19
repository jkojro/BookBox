require "spec_helper"

describe "books/show.html.haml" do
  it "displays the book page" do
    Book.delete_all
    @book = Book.create(title:'nowy show', description: 'show desc')

    render 

    expect(rendered).to have_content('nowy show')
    expect(rendered).to have_content('show desc')
    expect(rendered).to have_link('Back', href: root_path)
    expect(rendered).to have_link('Edit', href: edit_book_path(@book))
    expect(rendered).to have_link('Delete', href: book_path(@book))
  end

  describe "books/show" do
    it "displays the book with id" do
      book = Book.create!(title: 'show test title', description: 'show desc')
      controller.extra_params = { id: book.id }
      expect(controller.request.fullpath).to eq book_path(book)
    end
  end
end
