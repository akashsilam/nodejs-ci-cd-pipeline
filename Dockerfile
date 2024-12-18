
---

### 2. **`Dockerfile`**

This file defines how the Docker image for your Node.js application is built.

```dockerfile
# Dockerfile
FROM node:16

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3000
CMD ["node", "app.js"]
