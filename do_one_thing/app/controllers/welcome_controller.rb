class WelcomeController < ApplicationController

   def show
      @jobs = Job.all
      if valid_page?
        render template: "welcome/#{params[:page]}"
      else
        render file: "public/404.html", status: :not_found
      end
    end

    private
    def valid_page?
      File.exist?(Pathname.new(Rails.root + "app/views/welcome/#{params[:page]}.html.erb"))
    end
end
