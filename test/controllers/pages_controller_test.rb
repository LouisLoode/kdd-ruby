require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get profil" do
    get pages_profil_url
    assert_response :success
  end

end
