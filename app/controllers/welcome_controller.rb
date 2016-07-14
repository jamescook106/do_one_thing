#WelcomeController.rb
#This is the controller that sorts out generation of the pages

class WelcomeController < ApplicationController

   #This renders pages
   def show
      @jobs = Job.all
      if valid_page?
        render template: "welcome/#{params[:page]}"
      else
        render file: "public/404.html", status: :not_found
      end
    end

  #This action generates the individual job pages
  #It also stores analytics
  def generate
    @jobs = Job.all
    @hit = Job.where(url: params[:id]).first
    impressionist(@hit)
    render template: "welcome/opportunity"
  end

  #Page 2
  def no
    @jobs = Job.all
    render template: "welcome/latest_opportunities"
  end

    private
    def valid_page?
      File.exist?(Pathname.new(Rails.root + "app/views/welcome/#{params[:page]}.html.erb"))
    end

end
