require 'rails_helper'

RSpec.describe "posts/show", type: :view do
  before(:each) do
    @post = assign(:post, Post.create!(
      :titulo => "Titulo",
      :texto => "Texto",
      :curtidas => 1,
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Titulo/)
    expect(rendered).to match(/Texto/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(//)
  end
end
