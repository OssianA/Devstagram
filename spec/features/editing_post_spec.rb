require 'rails_helper'

feature 'Creating a post and edit it' do

    background do
       user_one = create(:user)
       user_two = create(:user, email: 'hi@hi.com', username: "Bboy", password: 'notasectret', id: user_one.id + 1)
     
       
        job_one = create(:post, caption: "will be edited", user_id: user_one.id)
        job_two = create(:post, caption: "will not be edited", user_id: user_two.id)
        
         sign_in_with user_one
        visit '/'
        
        
  end
  
  scenario 'the post is editable by user_one' do 
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    expect(page).to have_content('Edit Post')
    click_link 'Edit Post'
    fill_in 'Caption', with: 'Oh god dont!'
    click_button 'Update Post'
    expect(page).to have_content('Post updated')
    expect(page).to have_content('Oh god dont!')
  end
  
  scenario 'cannot edit a post that doesnt belong to you via show page' do
    find(:xpath, "//a[contains(@href,'posts/2')]").click
    expect(page).to_not have_content("Edit Post")
  
  end
  
  scenario 'cannot edit a post that doesnt belong to you via url path' do
    visit "posts/2/edit"
    expect(page.current_path).to eq root_path
    expect(page).to have_content("That post does not belong to you!")
  
  end
  
  scenario 'change the image to empty' do
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link "Edit Post"
    attach_file('Image', 'spec/files/coffee.zip')
    click_button 'Update Post'
    expect(page).to have_content('Update failed. Please check the form.')
  end
end

