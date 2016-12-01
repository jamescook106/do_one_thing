RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  config.authorize_with :cancan

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end

  config.model Job do
    label 'Opportunity'
    edit do
      field :name do
        required true
        label 'Headline'
        help 'This is the ‘headline’ for your opportunity.  Keep it short and snappy'
      end
      field :primary do
        label 'LHS Featured Opportunity'
      end
      field :secondary do
        label 'RHS Featured Opportunity'
        help 'These buttons determine which opportunities feature in the ‘Featured Opportunities’ section.  Please let the Sadmins know if you would like to ‘feature’ your opportunity.  Leave unchecked.'
      end
      field :url do
        required true
        label 'Internal URL Linking'
        help 'This is the internal linking code used by the website.  Choose one word from your headline and ensure it only contains letters and/or numbers.'
      end
      field :tagline do
        required true
        label 'Hover Over Image Text'
        help 'This is the ‘hover over’ text used on the images. It could be the same as the Headline but it would be good to include a bit more'
      end
      field :short do
        required true
        label 'Short Text'
        help 'This is the text on the front page of the website.  Try to make it attractive and obviously related to KCL researchers'
      end
      field :content do
        required true
        label 'Long Text'
        help 'This is the long text you see after you click through.  Make clear if the event is JUST for KCL researchers.  Include instructions for the Further Information section if necessary.'
      end
      field :contact do
        required true
        label 'Opportunity Contact'
        help 'This is URL or email address relating to the opportunity.  The website will automatically send the email.'
      end
      field :release do
        required true
        label 'Release Date'
        help 'This is date you want to ‘release’ the opportunity to the website. Please check when other opportunities are being released'
      end
      field :expiry do
        required true
        label 'Expiry Date'
        help 'This is the date you want the opportunity to leave the website.  It is fine to keep something on there for a couple of days after the closing date, to demonstrate the range of possible'
      end
      field :photo do
        required true
        label 'Image'
        help 'Please insert an image.  Make absolutely sure the image is copyright-free or used with permission.  Landscape images are better; make sure any text is in the centre of the image as the thumbnails cut into them.'
      end
      field :copyright do
        help 'If your image is copyrighted please supply the relevant source'
      end
    end
  end
end
