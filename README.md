# #KCLDo1Thing
The Researcher Development Unit at King’s College London is to run a campaign with the working title ‘#kcldo1thing’ to encourage PGRs and research staff to take up one of the numerous opportunities available to them at King’s. This website is a key element in the campaign. The project is delivered by the King’s Research Consultancy, funded by the Researcher Development Unit and Centre for Research Staff Development. 

The site is written using [Ruby on Rails](http://rubyonrails.org). It utilises [Foundation](http://foundation.zurb.com), [Devise](https://github.com/plataformatec/devise), [CanCan](https://github.com/ryanb/cancan), [Paperclip](https://github.com/thoughtbot/paperclip) and [Rails_Admin](https://github.com/sferik/rails_admin) to create an enjoyable user experience, as well as a secure admin interface that can be used to easily add more opportunities to the website.

The website was written by James Cook with the assistance of Aravindh Raham. If you have any questions please email james.cook@kcl.ac.uk.

# Install
Clone the repo
```
git clone git@github.com:jamescook106/do_one_thing.git
```
```cd``` into the correct folder and proceed to edit:
```
#config/database.yml
development:
  <<: *default
  database: test_dev
  username: development
  password: dev
```
to the correct settings for your postgresql information. After this has been done you should be able to run ```rake db:migrate``` successfully. Now we want to create a sadmin (super admin) user so that we can have full access to the rails_admin panel. N.B there is another level of admin (called admin) which can add new opportunities to the database, but not edit other users. Only sadmins have this privilege. To create the sadmin, type ```rails console```, and then
```
u=User.new()
u.email="YOUR_EMAIL"
u.password"YOUR_PASSWORD"
u.admin=true
u.sadmin=true
exit()
```
Congratulations, you have now created an admin user! At the moment we have configured paperclip to send images to AWS S3. You may either create your own bucket and write an .env file, or change the image storage to local by deleting
```
#config/environments/development.rb

config.paperclip_defaults = {
  storage: :s3,
  s3_credentials: {
    bucket: ENV.fetch('S3_BUCKET_NAME'),
    access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID'),
    secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
    s3_region: ENV.fetch('AWS_REGION'),
  },
  :url =>':s3_domain_url',
  :path => '/:class/:attachment/:id_partition/:style/:filename',
}

#config/environments/production.rb
config.paperclip_defaults = {
  storage: :s3,
  s3_credentials: {
    bucket: ENV.fetch('S3_BUCKET_NAME_p'),
    access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID'),
    secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
    s3_region: ENV.fetch('AWS_REGION_p'),
  },
  :url =>':s3_domain_url',
  :path => '/:class/:attachment/:id_partition/:style/:filename',
}
```
Once deleted you should now be able to run ```rails s``` and start up the server