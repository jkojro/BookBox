require 'rails_helper'

RSpec.describe BooksController, typr: :controller do
  describe 'GET #index' do
    it 'assigns @books' do
      book = Book.create(title:'test title', description: 'test description')
      get :index
      expect(assigns(:books)).to eq([book])
    end

    it 'returns http success' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      book = Book.create(title:'title', description: 'description')
      get :show, params: {id: book}
      expect(response).to render_template('show')
    end
  end

  describe 'GET #create' do
    it 'creates book' do
      expect do
        post :create, params: { book: {title:'title', description: 'desc'} }
      end.to change(Book, :count).by(1)
      expect(response).to have_http_status(:redirect)
    end

    it 'renders :new when invalid data' do
      expect do
        post :create, params: { book: {title:'', description: 'desc'} }
      end.to_not change(Book, :count)
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #edit' do
    it 'edit book' do
      book = Book.create(title:'edit test title', description: 'edit test description')
      get :edit, params: {id: book}
      expect(response).to be_successful
      expect(assigns(:book)).to eq(book)
    end
  end

  describe 'PUT #update' do
    it 'updates book title and description' do
      book = Book.create(title:'title', description: 'description')
      patch :update, params: { id: book.id, book: {title: 'updated title', description: 'updated desc'}}
      expect(book.reload.title).to eq 'updated title'
      expect(book.reload.description).to eq 'updated desc'
      expect(response).to have_http_status(:redirect)
    end
  end

  describe 'DELETE #destroy' do
    it 'deleted book' do
      book = Book.create(title:'title', description: 'description')

      expect do
        delete :destroy, params: {id: book}
      end.to change(Book, :count).by(-1)
      expect(response).to have_http_status(:redirect)
    end
  end
end
