---
title: Serving React With Nginx
layout: post
section-type: post
featured_img: img/posts/react-nginx/feature.png
category: tech
tags:
- bug fix
- devops
- experience
- fixes
- guide
- linux
- nginx
- tech
- tutorial
- web servers
---

Once we get used to serving static content with Nginx, it is hard to notice the subtle changes we might require to serve React static content which uses react-router.  I faced a similar bug when only the index page of [iit-techambit.in](https://iit-techambit.in) was being exposed and rest pages were to be found nowhere unless redirected from the home page itself.

![React With Nginx]({{"img/posts/react-nginx/feature.png" | absolute_url}})

> Nginx is a web server which can also be used as a reverse proxy, load balancer, mail proxy and HTTP cache.

> React is a JavaScript library for building user interfaces. It is maintained by Facebook and a community of individual developers and companies.

Apparently, even though the built files of a react are *static* they need to use a different Nginx configuration than our regular static file serving. The essay goes through the entire process of serving a react project named *demo-project* using Nginx.

---
### Build React For Production

We need to build our *demo-project* using the following command. This helps us create an optimized and caching enabled react build.

```bash
cd /path/to/directory/with/package.json
npm run build
```

Once the command finishes successfully, we will have the `build` directory which would contain the assets to be exposed using Nginx (we will get to it later).

NOTE: we will consider absolute path to this directory as `/home/demo-project/build`.

> npm is a package manager for the JavaScript programming language. It is the default package manager for the JavaScript runtime environment Node.js.

---
### Nginx Configuration

Now, the Nginx configuration begins and I'll be going line by line.  Create a new Nginx config file by following the below steps.

```bash
cd /etc/nginx/sites-available
touch demo-project.in
```

This would create a new file in the directory `sites-available` .

> Nginx server blocks configuration files are stored in /etc/nginx/sites-available directory, which are enabled through symbolic links to the /etc/nginx/sites-enabled/ directory. You can name the configuration file as you like but usually it is best to use the domain name.

Now opening the config file in your favorite editor, we create a server block with setting root as the path to build folder, index as any of the index files and name of the domains which should point to the server.

```bash
server {
	root /home/demo-project/build;
	index index.html index.htm index.nginx-debian.html;
	
	server_name demo-project.in www.demo-project.in;
}
```

> Nginx Server Blocks allows you to run more than one website on a single machine. With Server Blocks, you can specify the site document root (the directory which contains the website files), create a separate security policy for each site, use different SSL certificates for each site and much more.

Once we have the server block initiated we need to add blocks that will resolve the paths specified after the server_name. This is the crucial part which differs for *react*. Let's start by adding the basic location elements which should never be cached.

```bash
server {
	root /home/demo-project/build;
	index index.html index.htm index.nginx-debian.html;
	
	server_name demo-project.in www.demo-project.in;
	
	location ~* \.(?:manifest|appcache|html?|xml|json)$ {
		expires -1;
	}
}
```

> No caching should be specified for data files or manifests which have the highest probability of being updated frequently.

Next, we try to serve the resource content (referring to CSS/JS files) which supports the website. As it may happen that these files are rarely updated, we can set a larger cache expiry for them.

```bash
server {
	root /home/demo-project/build;
	index index.html index.htm index.nginx-debian.html;
	
	server_name demo-project.in www.demo-project.in;
	
	location ~* \.(?:manifest|appcache|html?|xml|json)$ {
		expires -1;
	}
	
	location ~* \.(?:css|js)$ {
		try_files $uri =404;
		expires 20d;
		access_log off;
		add_header Cache-Control "public";
	}
}
```

Now, we are left with only the routes (which should be sent to index.html) and routes with file extensions which should be accessing the respective file. We need not define any cache expiry header for the same.

```bash
server {
	root /home/demo-project/build;
	index index.html index.htm index.nginx-debian.html;
	
	server_name demo-project.in www.demo-project.in;
	
	location ~* \.(?:manifest|appcache|html?|xml|json)$ {
		expires -1;
	}
	
	location ~* \.(?:css|js)$ {
		try_files $uri =404;
		expires 20d;
		access_log off;
		add_header Cache-Control "public";
	}
	
	# any route containing a file extension
	location ~ ^.+\..+$ {
		try_files $uri =404;
	}

	# any route that doesn't have a file extension
	location / {
		try_files $uri $uri/ /index.html;	
	}
}
```

As we can see that whenever a file without file extension is mentioned, we make sure that we pass the same to index.html if it doesn't exist directly in the build directory. This is where the `react-router` comes into play. As the last step, we define the port on which the server should be listening (80 for our case).

```bash
server {
	root /home/demo-project/build;
	index index.html index.htm index.nginx-debian.html;
	
	server_name demo-project.in www.demo-project.in;
	
	location ~* \.(?:manifest|appcache|html?|xml|json)$ {
		expires -1;
	}
	
	location ~* \.(?:css|js)$ {
		try_files $uri =404;
		expires 20d;
		access_log off;
		add_header Cache-Control "public";
	}
	
	# any route containing a file extension
	location ~ ^.+\..+$ {
		try_files $uri =404;
	}

	# any route that doesn't have a file extension
	location / {
		try_files $uri $uri/ /index.html;	
	}
	
	listen 80;
}
```

> A port is an address for a program when data travels from one computer to another over a network.

As the last step, we need to create a symbolic link to the `demo-project.in` in the folder `/etc/nginx/sites-enabled`.

```bash
sudo ln -s /etc/nginx/sites-available/demo-project.in /etc/nginx/sites-enabled/demo-project.in
```

> Symbolic link is a term for any file that contains a reference to another file or directory in the form of an absolute or relative path and that affects pathname resolution.

Now out site shall be live at https://demo-project.in or http://demo-project.in after appropriate DNS settings pointing to our server IP address.

---
### Using HTTPS With Let's Encrypt (Optional)

We can use the free [Let's Encrypt](https://letsencrypt.org/) with the help of cert-bot to make our website HTTPS complient for free. First of all, we need to install cert; below are the instructions for a Debian based linux distribution.

```bash
sudo add-apt-repository ppa:certbot/certbot
sudo apt-get update
sudo apt-get install python-certbot-nginx
```

> Let's Encrypt is a non-profit certificate authority run by Internet Security Research Group that provides X.509 certificates for Transport Layer Security encryption at no charge. The certificate is valid for 90 days, during which renewal can take place at any time.

Next, we run the certbot for Nginx with the domains we need to get SSL certificates for.

```bash
sudo certbot --nginx -d demo-project.in -d www.demo-project.in
```

This will auto-update our Nginx configuration files with appropriate changes required for serving with HTTPS.

NOTE: Incoming on port 443 should be enabled for serving HTTPS.

---
### Conclusion

The instructions in this write up mostly aim at serving in a Debian based distribution  but can be used with any distribution on which Nginx can be installed. I used the above instructions to serve [iit-techambit.in](https://iit-techambit.in) which is written using React served with Digital Ocean droplets. Nginx also allows us to serve multiple web services on a single server by defining multiple server blocks.

The details above are kept at minimum and if you wish to read more, a list of references have been listed at the end.


#### References

- [How to Configure NGINX](https://www.linode.com/docs/web-servers/nginx/how-to-configure-nginx/)
- [Creating a React Production Build](https://create-react-app.dev/docs/production-build)
- [nginx: React Router Configuration](https://gkedge.gitbooks.io/react-router-in-the-real/content/nginx.html)
- [How To Secure Nginx with Let's Encrypt on Ubuntu 16.04](https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-ubuntu-16-04)