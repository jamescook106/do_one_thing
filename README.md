# #KCLDo1Thing
The Researcher Development Unit at King’s College London (KCL) is to run a campaign with the working title ‘#kcldo1thing’ to encourage Post Graduate Researchers (PGR)s and research staff to take up one of the numerous opportunities available to them at King’s. This website is a key element in the campaign. The project is delivered by the King’s Research Consultancy, funded by the Researcher Development Unit and Centre for Research Staff Development. The main functionality of the website is to display 'opportunities' that are appropiate, and sometimes exclusive, to KCL PGRs and research staff.

The site is written using [Ruby on Rails](http://rubyonrails.org). It utilises [Foundation](http://foundation.zurb.com), [Devise](https://github.com/plataformatec/devise), [CanCan](https://github.com/ryanb/cancan), [Paperclip](https://github.com/thoughtbot/paperclip) and [Rails_Admin](https://github.com/sferik/rails_admin) to create an enjoyable user experience, as well as a secure admin interface that can be used to easily add more opportunities to the website.

The website was written by James Cook with the assistance of Aravindh Raham. If you have any questions please email james.cook@kcl.ac.uk.

# Install

### Postgresql

For simplicity, we will now outline the installation of postgresql on Ubuntu. We start by installing postgresql, via the command
```
sudo apt-get install postgresql postgresql-contrib
```
Now we can create the development database, via the commands
```
sudo su - postgres
psql
CREATE USER developer WITH PASSWORD 'dev';
CREATE DATABASE development owner developer;
CREATE DATABASE test owner developer;
\q
```

These commands should create the appropiate databases for the the configured ```database.yml``` file.
### The Website

Clone the repo
```
git clone git@github.com:jamescook106/do_one_thing.git
```
```cd``` into the correct folder and proceed to edit:

```Ruby
#config/database.yml
development:
  <<: *default
  database: development
  host: localhost
  pool: 5
  username: developer
  password: dev

test:
  <<: *default
  database: test
  host: localhost
  pool: 5
  username: developer
  password: dev
```

to the correct settings for your postgresql information. If you created the databases outlined in the section above these settings will work. After this has been done you should be able to run ```rake db:migrate``` successfully. Now we want to create a sadmin (super admin) user so that we can have full access to the rails_admin panel. N.B there is another level of admin (called admin) which can add new opportunities to the database, but not edit other users. Only sadmins have this privilege. To create the sadmin, type ```rails console```, and then

```
u=User.new()
u.email="YOUR_EMAIL"
u.password"YOUR_PASSWORD"
u.admin=true
u.sadmin=true
exit()
```
Congratulations, you have now created an sadmin user! In the development environment you should simply be able to run ```rails s``` to start up the server!

### Production

At the moment we have configured paperclip to send images to AWS S3 in the production environment. You may either create your own bucket and write an .env file, or change the image storage to local by deleting
```

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

# Usage

## Users

Once the website is running we shall consider its usage from three perspectives, Sadmin, Admin and User. It is worth noting here that the difference between the three types of users is down to two booleans (Sadmin and Admin) in the User model. If we wanted additional levels of admin access, one would simply add another boolean.

#### Sadmin

As a Sadmin you will have access to the rails_admin admin interface. Using this interace you can add or remove other admins, as well as add opportunites to the site. Sadmin privileges should not be given to everyone.

#### Admin

As an admin you will have access to the rails_admin admin interface. With admin privileges you can add, edit and remove opportunites. However you cannot access other admins. It is recommended that staff are given admin privileges rather then sadmin unless it is vital that they have to manage other users.

#### User

If a user is created it cannot access the admin page, or do anything with a sadmin granting them admin status. The signup hyperlink is not present on the home page, to discourage random sign ups, but still allow staff to sign up given the appropiate URL. If these random sign-ups became a problem, one can simply remove the sign-up link, and enforce that only sadmins could create accounts for users

## Opportunites

The site uses jobs in the source code to refer to oportunties. This is to reduce spelling issues whilst coding! I will now present a few notes on how to input new opportunities to the site.

#### General

All fields must have correct spelling and grammer. In addition, all spaces and new lines must be written into the opportunity fields in the same way that you would want them to be presented onto the site.

#### URL

It is vital when inputting the url for an opportuity that the url is written only with letters and numbers. If any other characters are entered, i.e, fullstops or slashes, it will cause errors when clicking through opportunites. For the future an automatic URL will be generated from a unique id, however for now it is something that is entered manually.
