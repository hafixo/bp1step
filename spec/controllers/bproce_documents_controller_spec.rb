# frozen_string_literal: true
require 'rails_helper'
RSpec.describe BproceDocumentsController, type: :controller do
  let(:owner)            { FactoryGirl.create(:user) }
  let(:role)             { FactoryGirl.create(:role, name: 'author', description: 'Автор' ) }
  let!(:bproce)          { FactoryGirl.create(:bproce) }
  let!(:document)        { FactoryGirl.create(:document, owner: owner) }
  let(:valid_attributes) { { bproce_id: bproce.id, document_id: document.id } }
  let(:invalid_attributes) { { bproce_id: bproce.id, document_id: nil } }

  let(:valid_session) { {} }

  before(:each) do
    @user = FactoryGirl.create(:user)
    @user.roles << Role.find_or_create_by(name: 'admin', description: 'description')
    sign_in @user
    allow(controller).to receive(:authenticate_user!).and_return(true)
  end

  describe "GET show" do
    it "assigns the requested bproce_document as @bproce_document" do
      bproce_document = BproceDocument.create! valid_attributes
      get :show, {:id => bproce_document.to_param}, valid_session
      assigns(:bproce_document).should eq(bproce_document)
    end
  end

  describe "GET edit" do
    it "assigns the requested bproce_document as @bproce_document" do
      bproce_document = BproceDocument.create! valid_attributes
      get :edit, {:id => bproce_document.to_param}, valid_session
      assigns(:bproce_document).should eq(bproce_document)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new BproceDocument" do
        expect {
          post :create, {bproce_document: valid_attributes}, valid_session
        }.to change(BproceDocument, :count).by(1)
      end

      it "assigns a newly created bproce_document as @bproce_document" do
        post :create, {bproce_document: valid_attributes}, valid_session
        expect(assigns(:bproce_document)).to be_a(BproceDocument)
        expect(assigns(:bproce_document)).to be_persisted
      end

      it "redirects to the created bproce_document" do
        post :create, {bproce_document: valid_attributes}, valid_session
        expect(response).to redirect_to(BproceDocument.last.document)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved bproce_document as @bproce_document" do
        expect_any_instance_of(BproceDocument).to receive(:save).and_return(false)
        post :create, {bproce_document: invalid_attributes }, valid_session
        expect(assigns(:bproce_document)).to be_a_new(BproceDocument.last.document)
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested bproce_document" do
        bproce_document = BproceDocument.create! valid_attributes
        BproceDocument.any_instance.should_receive(:update_attributes).with({ "these" => "params" })
        put :update, {:id => bproce_document.to_param, :bproce_document => { "these" => "params" }}, valid_session
      end

      it "assigns the requested bproce_document as @bproce_document" do
        bproce_document = BproceDocument.create! valid_attributes
        put :update, {:id => bproce_document.to_param, :bproce_document => valid_attributes}, valid_session
        expect(assigns(:bproce_document)).to eq(bproce_document)
      end

      it "redirects to the bproce_document" do
        bproce_document = BproceDocument.create! valid_attributes
        put :update, {:id => bproce_document.to_param, :bproce_document => valid_attributes}, valid_session
        expect(response).to redirect_to(bproce_document)
      end
    end

    describe "with invalid params" do
      it "assigns the bproce_document as @bproce_document" do
        bproce_bapp = BproceDocument.create! valid_attributes
        expect_any_instance_of(BproceDocument).to receive(:save).and_return(false)
        put :update, {:id => bproce_document.to_param, :bproce_bapp => {  }}, valid_session
        expect(assigns(:bproce_document)).to eq(bproce_document)
      end

      it "re-renders the 'edit' template" do
        bproce_bapp = BproceDocument.create! valid_attributes
        expect_any_instance_of(BproceDocument).to receive(:save).and_return(false)
        put :update, {:id => bproce_document.to_param, bproce_id: bproce.to_param, document_id: document.to_param }, valid_session
        expect(response).to redirect_to bproce_document #render_template("edit")
      end
    end

    describe "with invalid params" do
      it "assigns the bproce_document as @bproce_document" do
        expect_any_instance_of(BproceDocument).to receive(:save).and_return(false)
        post :update, {:id => bproce_document.to_param, :bproce_document => {  }}, valid_session
        expect(assigns(:bproce_document)).to eq(bproce_document)

        expect_any_instance_of(BproceWorkplace).to receive(:save).and_return(false)
        post :create, {:bproce_workplace => {  }}, valid_session
        expect(assigns(:bproce_workplace)).to be_a_new(BproceWorkplace)

      end
    end
  end

    describe "DELETE destroy" do
    it "destroys the requested bproce_document" do
      bproce_document = BproceDocument.create! valid_attributes
      expect {
        delete :destroy, {:id => bproce_document.to_param, :bproce_id => bproce.to_param}, valid_session
      }.to change(BproceDocument, :count).by(-1)
    end

    it "redirects to the bproce_documents list" do
      bproce_document = BproceDocument.create! valid_attributes
      delete :destroy, {:id => bproce_document.to_param}, valid_session
      expect(response).to redirect_to bproce_url
    end
  end

end
