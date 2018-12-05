feature "Testing register" do
  scenario "creates a unique email address test and directs to add page" do
    visit('/register')
    fill_in('User Name', with: "test")
    fill_in('Email', with: "test")
    fill_in('Password', with: "password")
    click_button("Submit")
    expect(current_path).to eq('/spaces')
  end
end
