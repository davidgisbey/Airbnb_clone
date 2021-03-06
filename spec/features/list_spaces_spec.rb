feature 'List Spaces' do

  scenario 'return space property_name' do
    visit '/spaces'
    expect(page).to have_content "David's house"
    expect(page).to have_content "The Stockport viaduct"
	end

  scenario 'Display the price on /spaces' do
    visit '/spaces'
    expect(page).to have_content "£100.00"
    expect(page).to have_content "£0.20"
	end

  scenario 'display the description' do
    visit '/spaces'
    expect(page).to have_content "This is a house where david lives most of the time"
    expect(page).to have_content "stay for a night underneath the stockport"
	end

  scenario 'have the ability to email the owner of the space' do
    visit '/spaces'
    expect(page).to have_content "michael@email.com"
    page.find_link('david@email.com')[:href]
  end # This test is failing. Can you fix please?
end
