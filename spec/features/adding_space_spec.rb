feature "Adding a space" do
  scenario "clicking on list a space goes to adding page" do
    visit('/')
    fill_in('email', with: "david@email.com")
    fill_in('password', with: "password")
    click_button("Log in")
    expect(current_path).to eq('/spaces')
    click_button("Add a space")

    expect(page).to have_content("List a Space")
  end
  scenario "Adding a space" do
    visit('/')
    fill_in('email', with: "david@email.com")
    fill_in('password', with: "password")
    click_button("Log in")
    click_button("Add a space")
    fill_in('space_name', with: "Tent")
    fill_in('price_per_night', with: "100")
    fill_in('space_description', with: "This is a nice tent to live in.")
    fill_in('start', with: "2018-11-01")
    fill_in('end', with: "2018-11-13")
    click_button("List my space")
    expect(page).to have_content("This is a nice tent to live in.")
  end

end
