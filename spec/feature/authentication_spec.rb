feature 'authentication' do
  scenario 'a user can sign in' do
    # Create a test user
    User.create(first_name: "Sophie", last_name: "Gilder", email: "test@gmail.com", handle: "sophieg", password: "password123")

    # Then sign in as them
    visit '/chitter'
    click_button "Sign in"
    fill_in(:email, with: "test@gmail.com")
    fill_in(:password, with: "password123")
    click_button('Sign in')

    expect(page).to have_content 'Welcome, Sophie!'
  end

  scenario 'user sees error if they get their email address wrong' do
    User.create(first_name: "Sophie", last_name: "Gilder", email: "test@gmail.com", handle: "sophieg", password: "password123")

    visit 'sessions/new'
    fill_in(:email, with: "wrong@gmail.com")
    fill_in(:password, with: "password123")
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'Please check your email or password.'

  end

end