## **Docker Exercise: Setting Up a Simple Web Page**

### **Objective**
This exercise will guide you through creating a Docker container to serve a simple "Hello World" web page using Nginx.

### **Prerequisites**
Before we begin, ensure that Docker is installed on your machine.

#### **Installing Docker**

- **Windows and Mac**: 
    - Download Docker Desktop from [Docker Hub](https://hub.docker.com/).
    - Follow the installation instructions for [Windows](https://docs.docker.com/desktop/windows/install/) or [Mac](https://docs.docker.com/desktop/mac/install/).

- **Linux**: 
    - Use the package manager for your distribution. For example, on Ubuntu:
        ```bash
        sudo apt-get update
        sudo apt-get install docker-ce docker-ce-cli containerd.io
        ```
    - Follow the [official documentation](https://docs.docker.com/engine/install/) for other distributions.

### **Step 1: Create the HTML File**
Create a new file named `hello.html` with the following content:

```html
<!DOCTYPE html>
<html>
<head>
    <title>Hello World</title>
</head>
<body>
    <h1>Hello World!</h1>
    <p>This is a simple web page served using Docker and Nginx.</p>
</body>
</html>
```

> **What's happening?**
> - We are creating a simple HTML file that will be our web page. This file contains the structure and content of the web page that we want to display.

### **Step 2: Create the Dockerfile**
Create a new file in the same directory named `Dockerfile` with the following content:

```Dockerfile
# Use the official Nginx image from the DockerHub
FROM nginx

# Remove the default Nginx welcome page
RUN rm /usr/share/nginx/html/index.html

# Add our "Hello World" HTML file
ADD hello.html /usr/share/nginx/html/index.html
```

> **What's happening?**
> - `FROM nginx`: Specifies that our Docker image will be built on top of the official Nginx image.
> - `RUN rm /usr/share/nginx/html/index.html`: Removes the default Nginx welcome page.
> - `ADD hello.html /usr/share/nginx/html/index.html`: Copies our custom HTML file into the Docker image, replacing the default welcome page.

### **Step 3: Build the Docker Image**
Open a terminal and navigate to the directory containing `Dockerfile` and `hello.html`. Run the following command:

```bash
docker build -t my-hello-world .
```

> **What's happening?**
> - `docker build`: Command to build a new Docker image.
> - `-t my-hello-world`: Names (tags) our image as "my-hello-world".
> - `.`: Specifies that the build context (Dockerfile and any files it needs to copy) is in the current directory.

### **Step 4: Run the Docker Container**
Now, let's run our Docker container:

```bash
docker run -p 8080:80 my-hello-world
```

> **What's happening?**
> - `docker run`: Command to run a Docker container.
> - `-p 8080:80`: Maps port 8080 on the host to port 80 on the container. The web server inside the container (Nginx) listens on port 80 by default.
> - `my-hello-world`: Specifies the image to run.

### **Step 5: Test the Web Page**
Open your web browser and navigate to `http://localhost:8080`. You should see the "Hello World" web page.

> **What's happening?**
> - We are accessing the web server running inside the Docker container through port 8080 on our host machine, which is mapped to port 80 on the container.

### **Conclusion**
Congratulations! You've successfully created a Docker container to serve a simple web page using Nginx. You can use similar steps to containerize more complex applications.

---
