# shin-chan
---
### 这是蜡笔小新项目的后台
---
### 压测环境
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
