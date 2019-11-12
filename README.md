>一个用于漏洞赏金项目的胶水脚本，粘合了大量来自Github的轮子，有部分轮子经过小幅度修改  
https://github.com/fngoo/sh/blob/master/click_one.sh  
***
由于脚本的输入采用硬编码并且使用了大量git clone套娃，故仅供参考  
***
注意，此shell脚本包括端口扫描，大量发包，长期占用CPU等行为  
**在使用本工具进行检测时，您应确保该行为符合当地的法律法规，并且已经取得了足够的授权。请勿对非授权目标进行扫描。**  
**本程序仅供于学习交流，如您在使用本工具的过程中存在任何非法行为，您需自行承担相应后果，本程序开发者将不承担任何法律及连带责任。**
```
仅适用于Debian Server  
apt update
yes|apt install git
git clone https://github.com/fngoo/sh
bash sh/du_hast.sh
```
***
- [x] 一键部署，SSH进程分离（screen）
- [x] 根据服务器配置控制线程数（parallel)
- [x] Web实现代码热插拔（Github）
- [x] Web控制输入（Github repo（硬编码））  
***
- [x] DNS解析
- [x] 子域名收集
- [x] Github敏感信息发现
- [x] 云存储桶/容器检测 泄露/错误配置（AWS S3/AZURE/GOOGLE CLOUD)
- [x] 子域名劫持探测（包含引用的JavaScript所属域名）
- [ ] HTTP Smuggling
- [x] 常见Web服务端口截图
- [x] Web组件识别
- [x] 端点爬取
- [ ] waybackMachine URL
- [x] 端点隐藏参数发现
- [x] XSS扫描（GET方法）
- [x] HTML敏感信息
- [x] JavaScript敏感信息
- [x] JavaScript中端点提取
- [x] 敏感目录/文件扫描，截图
- [x] 漏洞扫描及常见PoC利用（无cookie）
- [x] 主机开放端口扫描及端口服务识别  
***
- [x] 新输出提醒（Slack api（硬编码）)
- [x] Web端查看输出（Python SimpleHTTPServer）
- [x] Exploit DB Web PoC更新监控，如与Web组件记录关键词匹配则提醒（Slack api（硬编码））  
***
![](https://github.com/fngoo/sh/blob/master/image/example.png)![](https://github.com/fngoo/sh/blob/master/image/txt.png)  
