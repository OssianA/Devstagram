require 'rails_helper'

feature 'Index displays a list of posts' do
  background do
     user_one = create(:user)
     sign_in_with user_one
     job_one = create(:post, caption: "This is post one", user_id: user_one.id)
     job_two = create(:post, caption: "This is the second post", user_id: user_one.id)
     job_three = create(:post, caption: "This is the third post", user_id: user_one.id)
   end
   
  scenario 'the index displays correct created job information' do
   
    
    
    visit '/'
    expect(page).to have_content("This is post one")
    expect(page).to have_content("This is the second post")
    expect(page).to have_css("img[src*='coffee.jpg']")
  end
end