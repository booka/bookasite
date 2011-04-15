require 'test_helper'


class SessionsControllerTest < ControllerTest
  test 'should have login link if not logged in' do
    visit root_path
    assert page.has_link? 'login_link'
  end

  test 'should have logout link if logged in' do
    user = User.create(:name => 'test', :email => 'test@test.com')
    visit enter_path(user.id)
    assert page.has_link? 'logout_link'
  end
end