

Building & testing
Run the following command in the same directory as docker-compose.yml to build the services:

docker-compose build
And now run the following to create and start the containers:

docker-compose up
You can optionally run the following to achieve the same result:

docker-compose up --build
You'll notice we didn't have to pass a filename to the command. Compose will look in the current directory for a docker-compose.yml file to build!

Open up http://127.0.0.1/ or http://localhost/ to see your Flask app in action. You should see:


Run the following to list any running images:

docker-compose images
Container    Repository     Tag       Image Id      Size
---------------------------------------------------------
flask       docker_flask   latest   d7ea63adcedf   899 MB
nginx       docker_nginx   latest   8b3031c24599   104 MB
docker-compose ps will list any running containers:

docker-compose ps
Name          Command          State         Ports
---------------------------------------------------------
flask   uwsgi app.ini          Up      8080/tcp
nginx   nginx -g daemon off;   Up      0.0.0.0:80->80/tcp

Reference Links

https://pythonise.com/series/learning-flask/building-a-flask-app-with-docker-compose#nginx-dockerfile

https://rlagowski.medium.com/create-flask-app-with-uwsgi-nginx-certbot-for-ssl-and-all-this-with-docker-a9f23516618d

https://codingwithmanny.medium.com/configure-self-signed-ssl-for-nginx-docker-from-a-scratch-7c2bcd5478c6

https://www.humankode.com/ssl/how-to-set-up-free-ssl-certificates-from-lets-encrypt-using-docker-and-nginx

https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-nginx-in-ubuntu-18-04

https://github.com/andresgutgon/self-signed-certificate-nginx-docker-compose

https://www.johnmackenzie.co.uk/posts/using-self-signed-ssl-certificates-with-docker-and-nginx/

https://github.com/itnok/docker-nginx-uwsgi-letsencrypt-flask


