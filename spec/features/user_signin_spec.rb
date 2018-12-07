feature "Testing register" do
  scenario "creates a unique email address test and directs to add page" do
    visit('/register')
    fill_in('User Name', with: "test")
    fill_in('Name', with: "hello")
    fill_in('Email', with: "test")
    fill_in('Password', with: "password")
    click_button("Register")
    expect(current_path).to eq('/spaces')
  end
end
feature "Testing sign in" do
  scenario "returns to login page if email address entered in incorrect" do
    visit('/')
    fill_in('email', with: "david")
    fill_in('password', with: "password")
    click_button("Log in")
    expect(page).to have_content('Please enter your email and password')
  end
  scenario "goes to registration page when button is clicked" do
    visit('/')
    click_button("Register")
    expect(page).to have_content('Please enter a username, unique email and password')
  end
  scenario "returns to login page if password entered in incorrect" do
    visit('/')
    fill_in('email', with: "david@email.com")
    fill_in('password', with: "incorrect")
    click_button("Log in")
    expect(page).to have_content('Please enter your email and password')
  end
  scenario "goes to spaces page when email and password correct" do
    visit('/')
    fill_in('email', with: "david@email.com")
    fill_in('password', with: "password")
    click_button("Log in")
    expect(current_path).to eq('/spaces')
  end
end
