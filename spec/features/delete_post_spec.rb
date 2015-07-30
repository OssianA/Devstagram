require 'rails_helper'

feature 'Create a post, edit and destroy it' do
  background do
    
       user_one = create(:user)
       sign_in_with user_one
        job_one = create(:post, caption: "Abs for days", user_id: user_one.id)
        visit '/'
        find(:xpath, "//a[contains(@href,'posts/1')]").click
        click_link "Edit Post"
  end
  it 'clicking the delete and confirm' do
    click_link "Delete Post"
    expect(page.current_path).to eq(posts_path )
    expect(page).to have_content('Post deleted')
    expect(page).to_not have_content('Abs for days')
  end
end
    