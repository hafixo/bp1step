# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LettersController, type: :controller do
  let(:valid_attributes) { { sender: 'sender', date: Date.current, subject: 'subject', number: '123', status: 0 } }
  let(:invalid_attributes) { { subject: 'invalid value' } }
  let(:valid_session) { {} }
  let(:letter) { FactoryBot.create :letter }
  let(:letter1) { FactoryBot.create :letter }

  before(:each) do
    @user = FactoryBot.create(:user)
    @user.roles << Role.find_or_create_by(name: 'author', description: 'Автор')
    sign_in @user
    allow(controller).to receive(:authenticate_user!).and_return(true)
  end

  describe 'GET index' do
    it 'assigns all letters as @letters' do
      get :index
      expect(response).to be_successful
      expect(response).to render_template('letters/index')
    end

    it 'loads all of the letters into @letters' do
      get :index
      expect(assigns(:letters)).to match_array([letter, letter1])
    end
  end

  describe 'GET show' do
    it 'assigns the requested letter as @letter' do
      letter = Letter.create! valid_attributes
      get :show, params: { id: letter.to_param }
      expect(assigns(:letter)).to eq(letter)
    end
  end

  describe 'GET new' do
    it 'assigns a new letter as @letter' do
      get :new
      expect(assigns(:letter)).to be_a_new(Letter)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested letter as @letter' do
      letter = Letter.create! valid_attributes
      get :edit, params: { id: letter.to_param }
      expect(assigns(:letter)).to eq(letter)
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new Letter' do
        expect do
          post :create, params: { letter: valid_attributes }
        end.to change(Letter, :count).by(1)
      end

      it 'assigns a newly created letter as @letter' do
        post :create, params: { letter: valid_attributes }
        expect(assigns(:letter)).to be_a(Letter)
        expect(assigns(:letter)).to be_persisted
      end

      it 'redirects to the created letter' do
        post :create, params: { letter: valid_attributes }
        expect(response).to redirect_to(Letter.last)
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved letter as @letter' do
        post :create, params: { letter: invalid_attributes }
        expect(assigns(:letter)).to be_a_new(Letter)
      end

      it "re-renders the 'new' template" do
        post :create, params: { letter: invalid_attributes }
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT update' do
    describe 'with valid params' do
      it 'updates the requested letter' do
        letter = Letter.create! valid_attributes
        expect_any_instance_of(Letter).to receive(:save).at_least(:once)
        put :update, params: { id: letter.to_param, letter: valid_attributes }
      end

      it 'assigns the requested letter as @letter' do
        letter = Letter.create! valid_attributes
        put :update, params: { id: letter.to_param, letter: valid_attributes }
        expect(assigns(:letter)).to eq(letter)
      end

      it 'redirects to the letter' do
        letter = Letter.create! valid_attributes
        put :update, params: { id: letter.to_param, letter: valid_attributes }
        expect(response).to redirect_to(letter)
      end
    end

    describe 'with invalid params' do
      it 'assigns the letter as @letter' do
        letter = Letter.create! valid_attributes
        expect_any_instance_of(Letter).to receive(:save).and_return(false)
        put :update, params: { id: letter.to_param, letter: invalid_attributes }
        expect(assigns(:letter)).to eq(letter)
      end

      it "re-renders the 'edit' template" do
        letter = Letter.create! valid_attributes
        expect_any_instance_of(Letter).to receive(:save).and_return(false)
        put :update, params: { id: letter.to_param, letter: invalid_attributes }
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested letter' do
      letter = Letter.create! valid_attributes
      expect do
        delete :destroy, params: { id: letter.to_param }
      end.to change(Letter, :count).by(-1)
    end

    it 'redirects to the letters list' do
      letter = Letter.create! valid_attributes
      delete :destroy, params: { id: letter.to_param }
      expect(response).to redirect_to(letters_url)
    end
  end
end
