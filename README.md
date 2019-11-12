Debian Server
```
apt update
yes|apt install git
git clone https://github.com/fngoo/sh
bash sh/du_hast.sh
```
***
此shell程序用于可自动化测试的攻击面  
粘合了大量来自Github的轮子，有部分轮子经过小幅度修改  
https://github.com/fngoo/sh/blob/master/click_one.sh
***
- [x] Debian一键部署，SSH进程分离（screen）
- [x] 根据服务器配置控制线程数（parallel)
- [x] Web实现代码热插拔（Github）
- [x] Web控制输入（Github repo）

- [x] DNS解析
- [x] 子域名收集
- [x] Github信息泄露
- [x] 云存储桶/容器 泄露/错误配置（AWS S3/AZURE/GOOGLE CLOUD)
- [x] 子域名劫持（包含引用的JavaScript所属域名）
- [ ] HTTP Smuggling
- [x] Web服务截图
- [x] Web组件识别
- [x] 端点爬取
- [ ] waybackMachine URL
- [x] HTTP状态码识别
- [x] 端点隐藏参数发现
- [x] 端点XSS扫描（GET方法）
- [x] html敏感信息
- [x] JavaScript敏感信息
- [x] JavaScript中端点提取
- [x] 敏感目录/文件扫描，截图
- [x] 漏洞扫描及常见PoC利用（无cookie）
- [x] 主机开放端口扫描及端口服务识别

- [x] 输出提醒（Slack api)
- [x] Web端查看输出（Python SimpleHTTPServer）
- [x] Exploit DB Web PoC更新监控，如与Web组件记录关键词匹配则提醒（Slack api）
