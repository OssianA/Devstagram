require 'spec_helper'

feature 'Can view individual posts' do
  background do
     user_one = create(:user)
    sign_in_with user_one
     @post = create(:post, user_id: user_one.id)
   end
 
  scenario 'Can click and view a single post' do
   
    
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    expect(page.current_path).to eq(post_path(@post))
  end
end

