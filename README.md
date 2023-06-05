## 说明
alpine 版本的ssh服务,`tzdata`用于设置时区
```
openssh tzdata bash
```
默认账号密码 `root:123456`
## docker build&push
这里使用了多平台构建并推送到hub，可使用`make docker.build`构建到本地
```bash
make docker.push
```
## 启动
```bash
docker run -d -p 222:22 --rm bimg/alpine-ssh
```
## 通过ssh 客户端连接SSH服务容器
```bash
ssh -p 222 root@127.0.0.1
```
输入密码`123456`即可登录
## 设置免密登录
```bash
ssh-copy-id -p 222 root@127.0.0.1
ssh -p 222 root@127.0.0.1
```