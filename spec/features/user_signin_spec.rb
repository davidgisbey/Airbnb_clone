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
feature "Testing sign in" do
  scenario "returns to login page if email address entered in incorrect" do
    visit('/login')
    fill_in('email', with: "david")
    fill_in('password', with: "password")
    click_button("Log in")
    expect(page).to have_content('Please enter your email and password')
  end
  scenario "returns to login page if password entered in incorrect" do
    visit('/login')
    fill_in('email', with: "david@email.com")
    fill_in('password', with: "incorrect")
    click_button("Log in")
    expect(page).to have_content('Please enter your email and password')
  end
  scenario "goes to spaces page when email and password correct" do
    visit('/login')
    fill_in('email', with: "david@email.com")
    fill_in('password', with: "password")
    click_button("Log in")
    expect(current_path).to eq('/spaces')
  end
end