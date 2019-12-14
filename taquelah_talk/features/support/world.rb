module Twitter

    class Actor
        include Capybara::DSL
        include RSpec::Matchers

        attr_accessor :login_name, :profile

        def initialize(options={})
           @login_name = options[:login_name] || 'James'
           @profile = options[:profile] || 'super_admin'

        end

        def performs(task)
            self
        end
        
        def asks(question)
            self
        end

        def self.user
            Actor.new({login_name: 'John', profile: 'user'})
        end
        
       

    end

    class Tasks
        include Capybara::DSL
        include RSpec::Matchers

        def open_twitter_page
            visit(ENV['environ'] )
        end
  
        def sign_in_with_username_and_password(username, password)
            
            fill_in 'session[username_or_email]', with: username
            fill_in 'session[password]', with: password
            find(:xpath, '//button[@class="submit EdgeButton EdgeButton--primary EdgeButtom--medium"]').click
        end

    end
    class Questions

        include Capybara::DSL
        include RSpec::Matchers

        def is_able_to_login_as_username(username)
            expect(page).to have_content('Home')
        end

        def is_unable_to_login_as_username(username)
           expect(page).to have_xpath('//span[@class="message-text"]')
        end
      
    end

    def user
        @user ||= Actor.user
    end

    def question_to_ask
        @question ||= Questions.new
    end

    def task_to_perform
        @task ||= Tasks.new
    end
end

World(Twitter)

