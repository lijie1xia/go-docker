/* 在docker容器中运行一个简单的HTTP服务器，监听8080端口。
当接收到对该服务器根路径“/”的HTTP请求，服务器会向客户端发送消息。 */

package main

import (
	"fmt"      // 用于格式化输入和输出
	"net/http" // 用于创建Web服务器
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		// 上面的函数含两个参数。第一个处理所有对根路径“/”的HTTP请求。第二个参数匿名函数，前者发送响应，后者接收请求
		fmt.Fprintln(w, "Happy Everyday") //将字符串写入响应中，发送给客户端
	})
	http.ListenAndServe(":8080", nil) // 启动HTTP服务器并监听8080端口，nil表示使用默认的多路复用器
}
