Go + Docker + K3s Demo

这是一个最小可行的示例项目，演示如何将一个 Go Web 服务容器化，并通过 Docker、GitHub Actions CI/CD 部署到 K3s 集群，同时使用 Nginx 做反向代理。
目标是完成从代码编写 → 镜像构建 → 容器运行 → 集群部署 → 反向代理的完整闭环。

项目结构
k8s_go_test
├─ Dockerfile                  # Go 服务 Docker 镜像构建文件
├─ go-deployment.yaml          # Go Deployment 配置
├─ go-pod.yaml                 # Go Pod 配置（可选）
├─ go-service.yaml             # Go Service 配置
├─ main.go                     # Go Web 服务代码
├─ nginx-go-config.yaml        # Nginx 配置（反向代理到 Go 服务）
├─ nginx-go-deployment.yaml    # Nginx Deployment 配置
├─ nginx-go-service.yaml       # Nginx Service 配置
└─ README.md

本地构建与运行

在项目根目录构建镜像：
docker build -t go-hello .


查看本地镜像：
docker images


运行容器：
docker run -p 8080:8080 go-hello


访问服务：
http://localhost:8080


页面返回：
Happy Everyday

技术要点
多阶段构建，减少镜像体积
使用 Alpine 作为运行环境，整体轻量
端口映射 -p 8080:8080
Dockerfile 包含关键指令：FROM、WORKDIR、COPY、RUN、CMD
CI/CD 与 Kubernetes 部署
使用 GitHub Actions 自动构建 Docker 镜像并推送到 DockerHub
使用 scp 和 SSH 自动将 Nginx 与 Kubernetes 配置同步到服务器
K3s 集群部署 Go 与 Nginx，Nginx 作为反向代理访问 Go 服务
自动滚动更新 Deployment，保证服务持续可用

为什么做这个示例
容器化和 CI/CD 是后端与云原生方向的基础技能。
独立完成从代码编写 → 镜像构建 → 集群部署 → Nginx 反向代理，意味着你已经具备把任意小项目快速容器化并上线的能力，为后续 Kubernetes 和 DevOps 实践打下基础。