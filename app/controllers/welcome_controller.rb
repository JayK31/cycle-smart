class WelcomeController < ApplicationController

    def index
      @user = User.new
      # @responses = HTTParty.get('http://nypd.openscrape.com/data/collisions.json.gz')
    end

end
