require 'spec_helper'
include Devise::TestHelpers

describe GalleriesController do
  let(:gallery) {create(:gallery)}
  let(:admin) {create(:admin)}
  
  context "when not logged in" do
    
    describe "GET #index" do
      it "should find all galleries" do
        gallery
        get :index
        expect(assigns(:galleries)).to eq([gallery])
      end

      it "should render index view" do
        get :index
        expect(response).to render_template(:index)
      end
    end

    describe "GET #show" do
      it "should find proper gallery" do
        get :show, id: gallery
        expect(assigns(:gallery)).to eq(gallery)
      end

      it "should render show template" do
        get :show, id: gallery
        expect(response).to render_template(:show)
      end
    end
  end

  context "when logged in" do
    before {sign_in(admin)}

    describe "GET #new" do
      it "should make a new gallery" do
        get :new, gallery: attributes_for(:gallery)
        expect(assigns(:gallery)).to be_a_new(Gallery)
      end

      it "should render new template" do
        get :new, gallery: attributes_for(:gallery)
        expect(response).to render_template(:new)
      end
    end

    describe "GET #edit" do
      it "should find a proper gallery" do
        get :edit, id: gallery
        expect(assigns(:gallery)).to eq(gallery)
      end

      it "should render edit template" do
        get :edit, id: gallery
        expect(response).to render_template(:edit)
      end
    end

    describe "POST #create" do
      it "should create new gakkery" do
        expect{post :create, gallery: attributes_for(:gallery)}.to change(Gallery, :count).by(1)
      end

      it "should redirect to the new gallery" do
        post :create, gallery: attributes_for(:gallery)
        expect(response).to redirect_to gallery_path(assigns[:gallery])
      end
    end

    describe "POST #update" do
      it "should find a proper gallery to edit" do
        post :update, id: gallery, gallery: attributes_for(:gallery, name: "Updated gallery")
        gallery.reload
        expect(gallery.name).to eq("Updated gallery")
      end

      it "should redirect to gallery path" do
        post :update, id: gallery, gallery: attributes_for(:gallery, name: "Updated gallery")
        expect(response).to redirect_to(gallery_path(gallery))
      end
    end

    describe "DELETE #destroy" do
      it "should remove gallery object" do
        gallery
        expect {delete :destroy, id: gallery}.to change(Gallery, :count).by(-1)
      end

      it "should redirect to galleries path" do
        gallery
        delete :destroy, id: gallery
        expect(response).to redirect_to(galleries_path)
      end
    end
  end


end
