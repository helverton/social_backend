require 'rails_helper'

RSpec.describe "comments/index", type: :view do
  before(:each) do
    assign(:comments, [
      Comment.create!(
        :texto => "Texto",
        :post => nil
      ),
      Comment.create!(
        :texto => "Texto",
        :post => nil
      )
    ])
  end

  it "renders a list of comments" do
    render
    assert_select "tr>td", :text => "Texto".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
