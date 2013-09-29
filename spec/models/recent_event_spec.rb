require 'spec_helper'

describe RecentEvent do
  let(:admin) {create(:admin)}
  let(:recent_event) {create(:recent_event, admin_id: admin)}
  subject {recent_event}

  it {should be_valid}
  it {should respond_to(:title)}
  it {should respond_to(:description)}
  it {should respond_to(:admin)}

  it "should not create without title" do
    recent_event.title = nil
    expect(recent_event).to_not be_valid
  end

  it "should not create without description" do
    recent_event.description = nil
    expect(recent_event).to_not be_valid
  end

  it "should not create without admin_id" do
    recent_event.admin_id = nil
    expect(recent_event).to_not be_valid
  end

end
