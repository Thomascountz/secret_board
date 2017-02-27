require 'rails_helper'

RSpec.describe "sessions/new.html.erb", type: :view do
  it "renders a user login form" do
    render

    assert_select "form[action=?][method=?]", login_path, "post" do

      assert_select "[name=?]", "session[email]"

      assert_select "[name=?]", "session[password]"
    end
  end
end
