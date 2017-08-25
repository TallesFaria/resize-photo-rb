# Resize photos challenge

### Requirements

- MongoDB running in localhost:27017. You can configure that in config/mongoid.yml.

1. Clone the repository locally:

		$ git clone https://github.com/raphaelabreu1/resize-photos-challenge

2. At the command prompt, access the folder of application:

		$ cd resize-photos-challenge

3. Bundle

		$ bundle install

4. To run tests, use rake command:

		$ rake

5. To run application in command line:

		rails s -p3000

6. To update the images with webservice endpoint http://54.152.221.29/images.json, run:

		$ curl --request POST http://localhost:3000/images/update_all

7. To list all the ten images with small, medium and large URLs, run:

		$ curl http://localhost:3000/images
