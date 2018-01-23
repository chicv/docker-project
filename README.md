# docker-project
开发环境的docker

###  Environment Requirements
 *  Mac OS
 *  Homebrew https://brew.sh/
 *  nginx  (brew install nginx)
 *  docker https://www.docker.com/get-docker  下载社区免费版
### vitual host 
 * git clone https://github.com/chicv/docker-project ~/Code/docker-project && cd  ~/Code/docker-project
 - php开发 前端开发忽略
  1. cd chicv-web-rest
  2. docker-composer up -d 
  3. 等待大概30分钟
 - 前端 开发
  1. cd  chicv-web
  2. docker-composer up -d
  3. 等待大概20分钟
 * sudo init.sh
### 代码部署
 * 生成ssh 公钥，提交给有关部门
 - 前端代码
  1. git clone git@git.chicv.com:chicv/stylewe-web-app.git ~/Code/stylewe   
  2. cd ~/Code/stylewe 
  3. npm install 
  4. npm start --help
 - rest 代码
  1. git clone 	git@git.chicv.com:chicv/stylewe-rest-service.git ~/Code/rest
  2. composer install
  3. ./artisan --help //  php7.1 required
### 检查
 *  进入虚拟机 docker exec -it chicv-web-rest bash 
 *  nginx_switch pro 切换前端页面数据源到正式环境
 *  浏览器打开l.stylewe.com 正常渲染 ，推荐使用chrome浏览器
### 其他
 *  编辑器推荐atom 或者 sublime
 
