def clear_session
  visit "/sessions/test"
end

def test_login(username, do_clear_session=true)
  clear_session if do_clear_session
  visit "/sessions/test?username=#{username}"
  wait_until_visible "#nav-username-link"
  evaluate_script('session.username()').should == username
end
