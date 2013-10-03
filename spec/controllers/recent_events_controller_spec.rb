require 'spec_helper'
include Devise::TestHelpers

describe RecentEventsController do

  let(:admin) { create(:admin)  } 
  let(:recent_event) { create(:recent_event, admin_id: admin) }

  context "when user is not logged in" do
    describe "GET #index" do
      it "should find all recent_events" do
        recent_event
        get :index
        expect(assigns(:recent_events)).to eq([recent_event])
      end

      it "should limit to 10 records" do
        create_list(:recent_event, 30)
        get :index
        expect(assigns(:recent_events).length).to eq(10)
      end

      it "should render index view" do
        get :index
        expect(response).to render_template(:index)
      end
    end

    describe "GET #show" do
      it "should find proper recent_event" do
        get :show, id: recent_event
        expect(assigns(:recent_event)).to eq(recent_event)
      end

      it "should render show view" do
        get :show, id: recent_event
        expect(response).to render_template(:show)
      end
    end
  end

  context "when user is logged in" do
    before {sign_in admin}

    describe "GET #new" do
      it "should define new recent_event" do
        get :new, admin_id: admin, recent_event: attributes_for(:recent_event)
        expect(assigns(:recent_event)).to be_a_new(RecentEvent)
      end

      it "should assign proper admin" do
        get :new, admin_id: admin, recent_event: attributes_for(:recent_event)
        expect(assigns(:admin)).to eq(admin)
      end

      it "should render a new template" do
        get :new, admin_id: admin, recent_event: attributes_for(:recent_event)
        expect(response).to render_template(:new)
      end
    end

    describe "GET #edit" do
      it "should find a proper recent_event" do
        get :edit, id:recent_event, admin_id: admin
        expect(assigns(:recent_event)).to eq(recent_event)
      end

      it "should render edit template" do
        get :edit, id:recent_event, admin_id: admin
        expect(response).to render_template(:edit)
      end
    end

    describe "POST #create" do
      it "should create new recent_event" do
        expect {post :create, admin_id: admin, recent_event: attributes_for(:recent_event, admin_id: admin)}.to change(RecentEvent, :count).by(1)
      end

      it "should redirect to recent_events" do
        post :create, admin_id: admin, recent_event: attributes_for(:recent_event, admin_id: admin)
        expect(response).to redirect_to recent_events_path
      end
    end


    describe "POST #update" do
      it "should update recent_event" do
        post :update, admin_id: admin, id: recent_event, recent_event: attributes_for(:recent_event, title: "Changed recent event")
        recent_event.reload
        expect(recent_event.title).to eq("Changed recent event")
      end

      it "should redirect to recent_events" do
        post :update, admin_id: admin, recent_event: attributes_for(:recent_event, admin_id: admin)
        expect(response).to redirect_to recent_events_path
      end
    end
  end

end
