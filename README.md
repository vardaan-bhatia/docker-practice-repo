# Docker Cheat Sheet and Guide for Developers

This is a comprehensive guide to Docker for developers with 1 year of experience. It includes essential commands, concepts, and usage tips commonly required in day-to-day development or for interviews.

## Table of Contents

1. [What is Docker?](#what-is-docker)
2. [Key Docker Concepts](#key-docker-concepts)
3. [Docker Installation](#docker-installation)
4. [Basic Commands](#basic-commands)
5. [Intermediate Commands](#intermediate-commands)
6. [Working with Dockerfiles](#working-with-dockerfiles)
7. [Docker Compose](#docker-compose)
8. [Docker Volumes](#docker-volumes)
9. [Docker Networking](#docker-networking)
10. [Best Practices](#best-practices)
11. [Common Docker Issues and Fixes](#common-docker-issues-and-fixes)
12. [Interview Questions](#interview-questions)
13. [Resources](#resources)

## What is Docker?

Docker is an open-source platform that automates the deployment of applications inside lightweight, portable containers. Containers bundle the application and its dependencies to ensure consistent behavior across different environments.

## Key Docker Concepts

### Images

- **Definition**: Read-only templates used to create containers.
- **Commands**:
  - List images:
    ```bash
    docker images
    ```
  - Remove an image:
    ```bash
    docker rmi <image_id>
    ```

### Containers

- **Definition**: Instances of Docker images that can run applications.
- **Commands**:
  - List running containers:
    ```bash
    docker ps
    ```
  - Start a container:
    ```bash
    docker start <container_id>
    ```
  - Stop a container:
    ```bash
    docker stop <container_id>
    ```
  - Remove a container:
    ```bash
    docker rm <container_id>
    ```

### Volumes

- **Definition**: Persistent data storage used to share data between containers and the host.
- **Commands**:
  - Create a volume:
    ```bash
    docker volume create <volume_name>
    ```
  - List volumes:
    ```bash
    docker volume ls
    ```
  - Inspect a volume:
    ```bash
    docker volume inspect <volume_name>
    ```

### Networks

- **Definition**: Allow communication between containers or with external systems.
- **Commands**:
  - List networks:
    ```bash
    docker network ls
    ```
  - Create a network:
    ```bash
    docker network create <network_name>
    ```
  - Connect a container to a network:
    ```bash
    docker network connect <network_name> <container_name>
    ```

## Docker Installation

1. Download [Docker Desktop](https://www.docker.com/products/docker-desktop).
2. Install Docker and follow the prompts.
3. Verify installation:
   ```bash
   docker --version
   ```

## Basic Commands

| Command                      | Description                       |
| ---------------------------- | --------------------------------- |
| `docker run <image>`         | Run a container from an image     |
| `docker pull <image>`        | Download an image from Docker Hub |
| `docker ps`                  | List running containers           |
| `docker ps -a`               | List all containers               |
| `docker stop <container_id>` | Stop a running container          |
| `docker rm <container_id>`   | Remove a container                |

## Intermediate Commands

| Command                             | Description                               |
| ----------------------------------- | ----------------------------------------- |
| `docker build -t <tag_name> .`      | Build an image from a Dockerfile          |
| `docker exec -it <container_id> sh` | Access a container's shell                |
| `docker logs <container_id>`        | View logs of a container                  |
| `docker inspect <object>`           | View detailed information about an object |
| `docker stats`                      | View resource usage of running containers |

## Working with Dockerfiles

A `Dockerfile` is a script that automates image creation.

### Example Dockerfile

```dockerfile
# Use a base image
FROM node:16

# Set working directory
WORKDIR /app

# Copy dependency files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy source code
COPY . .

# Expose the application port
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
```

### Build and Run

1. Build the image:
   ```bash
   docker build -t my-app .
   ```
2. Run the container:
   ```bash
   docker run -p 3000:3000 my-app
   ```

## Docker Compose

Docker Compose simplifies multi-container applications.

### Example docker-compose.yml

```yaml
version: "3.8"
services:
  app:
    build: .
    ports:
      - "3000:3000"
    volumes:
      - .:/app
    depends_on:
      - db
  db:
    image: postgres
    environment:
      POSTGRES_USER: user
      POSTGRES_PASSWORD: password
```

### Commands

- Start services:
  ```bash
  docker-compose up
  ```
- Stop services:
  ```bash
  docker-compose down
  ```

## Docker Volumes

- **Bind Mounts**: Link host directories.
- **Volumes**: Managed by Docker for portability.

## Docker Networking

- **Bridge**: Isolated container networks (default).
- **Host**: Containers share the host's network.

## Best Practices

1. Use multi-stage builds to minimize image size.
2. Avoid the `latest` tag for explicit versioning.
3. Use `.dockerignore` to exclude unnecessary files.
4. Keep Dockerfiles clean and modular.

## Common Docker Issues and Fixes

| Issue                       | Solution                                                   |
| --------------------------- | ---------------------------------------------------------- |
| Port already in use         | Stop conflicting containers: `docker stop $(docker ps -q)` |
| Container exits immediately | Check logs: `docker logs <container_id>`                   |

## Interview Questions

1. **What is Docker? How is it different from a VM?**
2. **Explain the purpose of a Dockerfile.**
3. **What are Volumes, and why are they useful?**
4. **How to debug a failing container?**
5. **Difference between Docker Compose and Kubernetes?**

## Resources

- [Docker Documentation](https://docs.docker.com/)
- [Docker Cheat Sheet](https://github.com/wsargent/docker-cheat-sheet)
