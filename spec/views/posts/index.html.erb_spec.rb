require 'spec_helper'

describe "posts/index" do
  let(:posts) { FactoryGirl.create_list(:post, 2) }
  before { assign(:posts, posts) }

  it "renders a list of posts" do
    render
    assert_select "tr>td", :text => posts.first.title, :count => 1
    assert_select "tr>td", :text => posts.last.title, :count => 1
  end
end
