require 'rails_helper'

feature 'Creating posts' do
  background do
     user_one = create(:user)
     sign_in_with user_one
   end
  scenario 'can create a job' do
    
    click_link 'New Post'
    attach_file('Image', "spec/files/images/coffee.jpg")
    fill_in 'Caption', with: 'nom nom nom #Coffetime'
    click_button 'Create Post'
    expect(page).to have_content('#Coffetime')
    expect(page).to have_css("img[src*='coffee.jpg']")
    expect(page).to have_content('Iamuser')
  end
  it 'need image to create post' do
    
    click_link 'New Post'
    fill_in 'Caption', with: 'nom nom no image'
    click_button 'Create Post'
    expect(page).to have_content("Your new post couldn't be created!")
  end
  
end

