require 'rails_helper'

RSpec.describe "comments/edit", type: :view do
  before(:each) do
    @comment = assign(:comment, Comment.create!(
      :texto => "MyString",
      :post => nil
    ))
  end

  it "renders the edit comment form" do
    render

    assert_select "form[action=?][method=?]", comment_path(@comment), "post" do

      assert_select "input#comment_texto[name=?]", "comment[texto]"

      assert_select "input#comment_post_id[name=?]", "comment[post_id]"
    end
  end
end
