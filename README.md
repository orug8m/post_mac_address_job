# 打刻作業を省くために、WiFiに接続したらSlackに打刻したい
## 
```
$ brew install arp-scan
```

database
```
create database net_work_info

create table devices(id bigint PRIMARY KEY NOT NULL AUTO_INCREMENT, user_id bigint NOT NULL, name varchar(255), mac_address char(17), nick_name varchar(255), created_at datetime NOT NULL DEFAULT CURRENT_TIMESTAMP, created_user varchar(128), updated_at datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, updated_user varchar(128), deleted boolean DEFAULT 0) CHARSET=utf8mb4;
```

```
create table users(id bigint PRIMARY KEY NOT NULL AUTO_INCREMENT,first_name varchar(255), last_name varchar(255), created_at datetime NOT NULL DEFAULT CURRENT_TIMESTAMP, created_user varchar(128), updated_at datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, updated_user varchar(128), deleted boolean DEFAULT 0) CHARSET=utf8mb4;
```
