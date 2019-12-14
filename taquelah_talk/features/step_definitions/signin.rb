Given(/^John is at the twitter login page$/) do
    @john = user
    @task = task_to_perform
    @question = question_to_ask   
    @john.performs(@task.open_twitter_page)
end

When(/^John sign in with username = "(.*)" and password = "(.*)"$/) do |username, password|
    @john.performs(@task.sign_in_with_username_and_password(username, password))
end

Then(/^John is able to login as username = "(.*)"$/) do |username|
    @john.asks(@question.is_able_to_login_as_username(username))
end

Then(/^John is unable to login as username = "(.*)"$/) do |username|
    @john.asks(@question.is_unable_to_login_as_username(username))
end