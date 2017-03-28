# API NPM and Bower
## Установить NVM
1. curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash
2. source ~/.profile
3. nvm install v7.7.4
4. nvm use 7.7.4
5. nvm alias default 7.7.4

## Настройка Gulp & Bower for Linux
1. npm i -g babel-register bower clean-css csslint express express-generator foundation-cli gulpjs/gulp#4.0 gulp-cli js-beautify jshint jslint minjson npm svgo uglify-js uglifycss uncss
2. cd /var/www/project
3. npm i  
**если Exception, то:**  
 * rm -rf node_modules 
 * npm i
 * npm rebuild
4. npm up
5. bower i  

## Установка / удаление пакетов
### Установка пакетов в режиме Production
1. npm i "package_name" --save
2. bower i "package_name" --save

### Установка пакетов в режиме Developer (при сборке, они не будут подключенны для проекта)
1. npm i "package_name" --save–dev
2. bower i "package_name" --save-dev

### Удаление пакетов в режиме Production
1. npm un "package_name" --save
2. bower uninstall "package_name" --save

### Удаление пакетов в режиме Developer (при сборке, они не будут подключенны для проекта)
1. npm un "package_name" --save–dev
2. bower uninstall "package_name" --save-dev

## Exception watch
1. echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p  
**Если возникает ошибка запуска на watch-ерах**
