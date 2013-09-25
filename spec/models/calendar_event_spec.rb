require 'spec_helper'

describe CalendarEvent do
  let(:calendar_event) {create(:calendar_event)}
  subject {calendar_event}

  it {should respond_to(:title)}
  it {should respond_to(:from)}
  it {should respond_to(:to)}
  it {should respond_to(:note)}

  it {should be_valid}

  it "should not be valid without title" do
    calendar_event.title = nil
    expect(calendar_event).to_not be_valid
  end

  it "should not be valid without from" do
    calendar_event.from = nil
    expect(calendar_event).to_not be_valid
  end

  it "should not be valid without to" do
    calendar_event.to = nil
    expect(calendar_event).to_not be_valid
  end

  it "should be valid without a note" do
    calendar_event.note = nil
    expect(calendar_event).to be_valid
  end


end
