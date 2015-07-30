require 'rails_helper'

feature 'Creating a post and edit it' do

    background do
       user_one = create(:user)
      sign_in_with user_one
       
        job_one = create(:post, caption: "will be edited", user_id: user_one.id)
        visit '/'
        find(:xpath, "//a[contains(@href,'posts/1')]").click
        click_link 'Edit Post'
  end
  
  scenario 'the post is clicked and edited' do 
    fill_in 'Caption', with: 'Oh god dont!'
    click_button 'Update Post'
    expect(page).to have_content('Post updated')
    expect(page).to have_content('Oh god dont!')
  end
  
  scenario 'change the image to empty' do
    attach_file('Image', 'spec/files/coffee.zip')
    click_button 'Update Post'
    expect(page).to have_content('Update failed. Please check the form.')
  end
end

