require "rails_helper"

feature "posting comments on posts" do
  background do
    user_one = create(:user)
    job_one = create(:post, caption: "Abs for days", user_id: user_one.id)
    sign_in_with user_one
    visit '/'
    
  end
  scenario "visit and comment the first post", :js => true do
   
    find_field('comment[content]')
       
    page.execute_script("console.log('test')")
   
    expect(page).to have_css("div.comments#{post.id}", text: ';P')
  end
end
