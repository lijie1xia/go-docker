Go + Docker Demo
一个最小可行的示例项目，演示如何将一个 Go Web 服务打包成 Docker 镜像并运行为容器。目标是完成从编写代码到构建镜像再到运行容器的完整闭环。

项目结构
.
├─ main.go
└─ Dockerfile

构建镜像
在项目根目录执行：
docker build -t go-hello .


构建完成后可通过以下命令查看镜像：
docker images

运行容器
docker run -p 8080:8080 go-hello

然后访问：
http://localhost:8080


页面将返回：
Hello Docker + Go!!!!

技术要点
1、多阶段构建，减少镜像体积。
2、使用 Alpine 作为运行环境，整体更轻量。
3、通过 -p 8080:8080 完成端口映射。
4、Dockerfile 包含基础但关键的构建指令：FROM、WORKDIR、COPY、RUN、CMD。

为什么要做这个示例
容器化是后端与云原生方向的基础技能。能够独立完成代码编写、镜像构建和容器部署，意味着你已经具备把任意小项目快速容器化的能力，为后续部署到 Kubernetes 做铺垫。
```
k8s_go_test
├─ Dockerfile
├─ go-deployment.yaml
├─ go-pod.yaml
├─ go-service.yaml
├─ main.go
├─ nginx-go-config.yaml
├─ nginx-go-deployment.yaml
├─ nginx-go-service.yaml
└─ README.md

```