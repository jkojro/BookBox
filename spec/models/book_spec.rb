require 'rails_helper'

RSpec.describe Book, type: :model do
  it 'requires title' do
    book = Book.new(description: 'Sample description')
    expect(book.valid?).to be_falsey
  end 

  it 'requires description' do
    book = Book.new(title: 'Sample title')
    expect(book.valid?).to be_falsey
  end

  it 'accepts any title and description' do
    book = Book.new(title: 'Sample title', description: 'Shor description')
    expect(book.valid?).to be_truthy
  end
end
