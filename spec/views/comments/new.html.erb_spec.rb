require 'rails_helper'

RSpec.describe "comments/new", type: :view do
  before(:each) do
    assign(:comment, Comment.new(
      :texto => "MyString",
      :post => nil
    ))
  end

  it "renders new comment form" do
    render

    assert_select "form[action=?][method=?]", comments_path, "post" do

      assert_select "input#comment_texto[name=?]", "comment[texto]"

      assert_select "input#comment_post_id[name=?]", "comment[post_id]"
    end
  end
end
