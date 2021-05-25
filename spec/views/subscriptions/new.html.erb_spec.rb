require 'rails_helper'

RSpec.describe "subscriptions/new", type: :view do
  before(:each) do
    assign(:subscription, Subscription.new(
      name: "MyString",
      user: nil,
      meal: nil
    ))
  end

  it "renders new subscription form" do
    render

    assert_select "form[action=?][method=?]", subscriptions_path, "post" do

      assert_select "input[name=?]", "subscription[name]"

      assert_select "input[name=?]", "subscription[user_id]"

      assert_select "input[name=?]", "subscription[meal_id]"
    end
  end
end
