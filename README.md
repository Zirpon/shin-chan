# shin-chan
---
### 这是蜡笔小新项目的后台
---
### 压测环境
```
webbench -c 并发数 -t 运行测试时间 URL
webbench -c 5000 -t 120 "http://127.0.0.1/interface.php?handler=message&findex=2016"

ab -n 800 -c 100  "http://127.0.0.1/interface.php?handler=message&findex=2016"    # 总共800个请求，100路并发
ab -t 60 -c 100   "http://127.0.0.1/interface.php?handler=message&findex=2016"    # 总共运行60秒，100路并发

```

机器名子 | cpu | mem | 并发数 | 测试时间 |吞吐率(request/second) | 并发请求平均耗时(ms)| 
--- | --- |--- | --- | --- | --- | ---
mac_虚拟机_CentOS6.5|4*i(Intel i7-4870HQ 2.5GHZ)| 1.8G | 12200 | 1min | 1100 | 0.962
---
配置sendmail crontab 
---
```
        sendmail记事:改hostname 要同步/etc/sysctlconfig/network /etc/hosts 具体看本地服配置 重启sendmail服务
        php error_log 发送邮件 QQ邮箱 可以接收 公司邮箱不可以 不清楚什么原因 错误提示是 dsn=5.0.0, stat=Service unavailable在网上看了很多都没改好
        终端mail 命令 QQ邮箱跟公司邮箱都可一接收
        怀疑时php.ini 问题，  
        php.ini 可以配置记录发邮件的log 具体看测试服 或者 本地服 配置文件
```
---
php nginx 错误记录路径:
/var/log/nginx/
/var/log/php-fpm/

---
部署：
>
1. 修改/etc/sysconfig/network
2. git clone 项目 到 /data/ 路径
3. 配置nginx.conf
4. 配置nginx的负载均衡default.conf shinchan.conf
5. 配置sendmail
6. 配置php.ini
7. 有些机器nginx.conf的server配置包include enable-php.conf;负载均衡的server去掉这个才能生效
```
  1         location ~ [^/]\.php(/|$)
  2         {
  3             try_files $uri =404;
  4             fastcgi_pass  unix:/tmp/php-cgi.sock;
  5             fastcgi_index index.php;
  6             include fastcgi.conf;
  7         }
```
8. 用whereis定位php路径 看清楚 php log 日志路径记在哪里`
9. 导入数据库表
10. 配置php.ini sendmail 的设置
11. 配置/etc/hosts
12. php显示超时要看 是不是sendmail的配置没有配置好 那个/etc/hosts没有配置好就会出现超时
13. 服务器数据库备份脚本
14. 始终没有搞懂为什么hostname怎么改才在邮件生效
