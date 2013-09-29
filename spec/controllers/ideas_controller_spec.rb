require 'spec_helper'
include Devise::TestHelpers

describe IdeasController do
  let(:idea) { create(:idea) }
  let(:admin) { create(:admin) }

  context "when user is logged in" do
    before {sign_in admin}

    describe "GET #index" do

      it "should find all ideas" do
        idea
        get :index
        expect(assigns(:ideas)).to eq([idea])
      end

      it "shoul render index view" do
        get :index
        expect(response).to render_template :index
      end
    end

    describe "GET #new" do
      it "should define new idea" do
        get :new, idea: attributes_for(:idea)
        expect(assigns(:idea)).to be_a_new(Idea)
      end

      it "should render new template" do
        get :new, idea: attributes_for(:idea)
        expect(response).to render_template :new
      end
    end

    describe "POST #create" do
      it "should create new idea" do
        expect {post :create, idea: attributes_for(:idea)}.to change(Idea, :count).by(1)
      end

      it "should redirect to ideas path" do
        post :create, idea: attributes_for(:idea)
        expect(response).to redirect_to ideas_path
      end
    end

    describe "DELETE #destroy" do
      it "should delete idea" do
        idea
        expect {delete :destroy, id: idea}.to change(Idea, :count).by(-1)
      end
    end
  end
end
