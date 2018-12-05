feature "Adding a space" do
  scenario "Adding a space" do
    visit('/')
    fill_in('User Name', with: "nimalank7")
    fill_in('Password', with: "nimalank7")
    click_button("Submit")
    click_button("List a space")
  end
end
