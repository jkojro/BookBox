require "spec_helper"

describe "books/index.html.haml" do
  it "displays all the books" do
    assign(:books, [
      Book.new(title: 'first test', description: 'desc1'),
      Book.new(title: 'second test', description: 'desc2')
    ])

    render

    expect(rendered).to match /first test/
    expect(rendered).to match /second test/
  end
end