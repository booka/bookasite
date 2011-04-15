require 'test_helper'


class SeriesControllerTest < ControllerTest

  setup do
    @serie1 = Serie.create(:title => 'serie1', :icon_path => 'icon.png')
  end

  test 'should GET index' do
    visit series_index_path
    assert_response :success
  end

  test 'index should have add link if privilegies are enough' do
    visit series_index_path
    assert page.has_no_link? 'new_serie_link'

    user = User.create(:name => 'admin', :email => 'admin@admin', :roles => 'admin')
    visit enter_path(user.id)
    visit series_index_path
    assert page.has_link? 'new_serie_link'
  end


  test 'should GET show' do
    visit series_path(@serie1)
    assert_response :success
    assert page.has_content?('serie1')
  end


end