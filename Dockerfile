# 构建阶段

# 选择基础镜像并将其命名为builder
FROM golang:1.22 AS builder    

# 设置工作目录，所有命令都将在该目录下执行
WORKDIR /app

# 将当前主机的文件复制到工作目录中，两个点意味着复制所有文件。
# 第一个. 表示主机上的源目录，第二个. 是镜像中的目标目录。
COPY  . .

# 1 初始化一个新的go模块，模块路径为hello。会创建一个go.mod文件，用以描述模块的依赖关系
# 2 编译go源代码，生成可执行文件hello。
RUN go mod init hello
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o hello .

# 运行阶段
# Alpine Linux是一个轻量级Linux发行版，适用于构建轻量级Docker镜像
FROM alpine:latest

WORKDIR /app

# 从构建阶段的镜像builder中复制所生成的可执行文件hello到当前镜像中
COPY --from=builder /app/hello .

RUN chmod +x hello

# 告诉docker该容器应用运行在8080端口上
EXPOSE 8080

# 定义容器运行时的命令为./hello。运行之前构建好的可执行文件
CMD ["./hello"]