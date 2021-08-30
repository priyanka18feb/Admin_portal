# Stage 1
2
3
FROM node:latest as node
4
5
RUN mkdir -p /app
6
7
WORKDIR /app
8
9
COPY package.json /app
10
11
RUN npm install
12
13
COPY . /app
14
15
RUN npm run build --prod
16
17
 
18
19
# Stage 2
20
21
FROM nginx:alpine
22
23
COPY --from=node /app/dist/adminportal /usr/share/nginx/html