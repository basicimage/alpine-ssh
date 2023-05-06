FROM alpine:3.15.8

# 替换阿里云的并更新源、安装openssh 并修改配置文件和生成key 并且同步时间
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
	&& apk update \
	&& apk add --no-cache openssh tzdata bash\
	&& cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
	&& sed -i "s/#PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config \
	&& ssh-keygen -t dsa -P "" -f /etc/ssh/ssh_host_dsa_key \
	&& ssh-keygen -t rsa -P "" -f /etc/ssh/ssh_host_rsa_key \
	&& ssh-keygen -t ecdsa -P "" -f /etc/ssh/ssh_host_ecdsa_key \
	&& ssh-keygen -t ed25519 -P "" -f /etc/ssh/ssh_host_ed25519_key \
	&& echo "root:123456" | chpasswd \
	&& rm -rf /var/lib/apt/lists/* \
	&& rm /var/cache/apk/*

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
