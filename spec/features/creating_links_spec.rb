feature 'creating a link' do
  scenario "add the site's URL and title" do
    visit ('/links/new')
    fill_in('url', :with => 'www.facebook.com')
    fill_in('title', :with => 'Facebook')
    click_button('Submit')
    expect(page).to have_content('Facebook')
  end
end
