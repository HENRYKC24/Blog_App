require 'rails_helper'

RSpec.describe 'User Index features', type: :feature do
  before(:each) do
    visit user_session_path
    @henry = User.create!(name: 'henry', bio: 'bio', photo: 'profile.png',
                          email: 'ally1@mail.com', password: 'asdzxc', posts_counter: 0, confirmed_at: Time.now)

    fill_in 'Email', with: 'ally1@mail.com'
    fill_in 'Password', with: 'asdzxc'
    click_button 'Log in'

    @post1 = @henry.posts.create!(title: 'Cats and Dogs', text: 'Lorem ipsum dolor sit amet1.', comments_counter: 0,
                                  likes_counter: 0)
    @post2 = @henry.posts.create!(title: 'Food', text: 'Lorem ipsum dolor sit amet2.', comments_counter: 0,
                                  likes_counter: 0)
    @post3 = @henry.posts.create!(title: 'Cars', text: 'Lorem ipsum dolor sit amet3.', comments_counter: 0,
                                  likes_counter: 0)

    visit user_path(@henry)
  end

  describe 'all test' do
    it 'I can see the the post title.' do
      expect(page).to have_content('Food')
    end

    it 'I can see the user\'s username.' do
      expect(page).to have_content('henry')
    end

    it 'I can see the number of posts the user has written.' do
      expect(page).to have_content '3'
    end

    it 'I can see the user\'s bio.' do
      expect(page).to have_content 'bio'
    end

    it 'I can see the user\'s first 3 posts.' do
      expect(page).to have_content 'Cats and Dogs'
      expect(page).to have_content 'Food'
      expect(page).to have_content 'Cars'
    end

    it 'I can see a button that lets me view all of a user\'s posts.' do
      expect(page).to have_content 'See All Posts'
    end

    it 'When I click to see all posts, it redirects me to the user\'s post\'s index page.' do
      click_link('See All Posts')
      expect(page).to have_current_path user_posts_path(@henry)
    end
  end
end
