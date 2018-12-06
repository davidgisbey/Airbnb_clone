feature "Booking a space" do
  scenario "Clicking on directs to page" do
    visit('/')
    fill_in('email', with: "david@email.com")
    fill_in('password', with: "password")
    click_button("Log in")
    expect(current_path).to eq('/spaces')
    click_button("Book The Stockport viaduct")
    expect(page).to have_content("Book your stay")
  end
end
