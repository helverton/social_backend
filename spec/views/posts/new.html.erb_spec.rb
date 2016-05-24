require 'rails_helper'

RSpec.describe "posts/new", type: :view do
  before(:each) do
    assign(:post, Post.new(
      :titulo => "MyString",
      :texto => "MyString",
      :curtidas => 1,
      :user => nil
    ))
  end

  it "renders new post form" do
    render

    assert_select "form[action=?][method=?]", posts_path, "post" do

      assert_select "input#post_titulo[name=?]", "post[titulo]"

      assert_select "input#post_texto[name=?]", "post[texto]"

      assert_select "input#post_curtidas[name=?]", "post[curtidas]"

      assert_select "input#post_user_id[name=?]", "post[user_id]"
    end
  end
end
