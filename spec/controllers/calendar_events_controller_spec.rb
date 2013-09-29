require 'spec_helper'
include Devise::TestHelpers
describe CalendarEventsController do
  let(:calendar_event) {create(:calendar_event)}
  let(:admin) {create(:admin)}

  describe "GET #index" do
    it "should find all events" do
      calendar_event
      get :index
      expect(assigns(:calendar_events)).to eq([calendar_event])
    end
  end

  context "when logged in" do

    before {sign_in admin}

    describe "GET #new" do
      it "should create new calendar even" do
        get :new, calendar_event: attributes_for(:calendar_event)
        expect(assigns(:calendar_event)).to be_a_new(CalendarEvent)
      end

      it "should render a new template"do
        get :new, calendar_event: attributes_for(:calendar_event)
        expect(response).to render_template(:new)
      end
    end


    describe "GET #edit" do
      it "should find proper calendar even" do
        get :edit, id: calendar_event
        expect(assigns(:calendar_event)).to eq(calendar_event)
      end

      it "should render edit template"do
        get :edit, id: calendar_event
        expect(response).to render_template(:edit)
      end
    end

    describe "POST #create" do
      it "should create new event" do
        expect{post :create, calendar_event: attributes_for(:calendar_event)}.to change(CalendarEvent, :count).by (1)
      end

      it "should redirect to root" do
        post :create, calendar_event: attributes_for(:calendar_event)
        expect(response).to redirect_to root_path
      end
    end

    describe "POST #update" do
      it "should update event" do
        post :update, id:calendar_event, calendar_event: attributes_for(:calendar_event, title: "Changed Event")
        calendar_event.reload
        expect(calendar_event.title).to eq("Changed Event")
      end

      it "should redirect to root" do
        post :update, id: calendar_event, calendar_event: attributes_for(:calendar_event)
        expect(response).to redirect_to root_path
      end
    end

  end
end
