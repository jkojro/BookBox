require 'rails_helper'

describe 'books/new' do
  it 'displays the book form' do
    book = stub_model(Book)
    assign(:book, book)
    
    render
    
    expect(rendered).to have_content('Add your book')
    expect(rendered).to have_selector("form label[for *= 'title']")
    expect(rendered).to have_selector("form label[for *= 'description']")
    expect(rendered).to have_button
    expect(rendered).to have_link('Back', href: root_path)
  end
end