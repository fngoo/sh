漏洞赏金猎人的好伙伴
------
>一段用于VPS的胶水shell,粘合了[大量来自GitHub的轮子](./click_one.sh),用于大规模信息搜集  
  
简体中文 | [English](./README.md) | [Kali Linux](./split_for_kali-Debian7.md)  
    
## 使用
自定义sh/one.sh中的输入 ---> bash sh/du_hast.sh
#### 注意
- 此脚本输入通过GitHub文件控制，使用前请修改sh/one.sh中输入部分，或者以示例目标直接运行。  
``` 
仅测试过Debian9.x VPS  
apt update
apt install -y -q git
cd /root
git clone https://github.com/fngoo/sh
bash sh/du_hast.sh
```
## 特性
- [x] 一键部署 
- [x] 运行后创建screen与SSH进程分离
- [x] 根据服务器配置控制并行数(parallel)
- [x] Web控制输入目标(one.sh : target="curl github_url")  
一部分来源于漏洞赏金目标收集项目  
https://github.com/arkadiyt/bounty-targets-data  
另一部分为自定目标  
- [x] 定时循环，检测到仓库文件变动即工作  
- [x] 自动更新工具   
## 流程
- [x] 子域名收集(组合)
- [x] DNS解析(去除泛解析域名)
- [x] Github敏感信息发现
- [x] 云存储桶/容器检测(s3 bucket/Azure/Google bucket)
- [x] 子域名及二阶子域名劫持探测
- [ ] HTTP Smuggling
- [ ] DNS-server cache poison
- [x] 常见Web服务端口截图
- [x] Web组件识别
- [x] 爬虫
- [x] waybackMachine URL
- [x] 隐藏参数发现
- [x] XSS
- [x] HTML敏感信息
- [x] CRLF(如存在，输出至HTML敏感信息结果文本)
- [x] JavaScript敏感信息
- [x] JavaScript端点提取
- [x] 敏感目录/文件扫描，截图
- [x] xray更新及Web漏洞扫描(未获取登录后cookie)
- [ ] 绕过CDN
- [ ] 组件及端口服务关键词相关PoC利用  
- [x] 主机开放端口扫描及端口服务识别  
- [x] 默认端口服务未授权检测(ftp，Memcached，mongodb，zookeeper，Redis，elasticsearch)  
## [输出](./image)
- [x] 新输出提醒(Slack API)
- [x] Web端查看输出(Python SimpleHTTPServer)
- [x] Exploit DB Web PoC更新监控，如与Web组件记录关键词匹配则提醒(Slack API)  
- [ ] Exploit DB PoC更新监控，如与端口服务记录关键词匹配则提醒(Slack API)  
- [x] txt文本形式快速输出有价值信息  
- [x] 生成zip文件，并解压一份至Web端以便快速浏览  
## 声明
**在使用本工具进行检测时，您应确保该行为符合当地的法律法规，并且已经取得了足够的授权。请勿对非授权目标进行扫描。**  
**本程序仅供于学习交流，如您在使用本工具的过程中存在任何非法行为，您需自行承担相应后果，本程序开发者将不承担任何法律及连带责任。**   
## 作者
作者：你好  
联系：  
>part_1="https://hooks.sla" ; part_2="ck.com/services/TM26L9ZEE/BR1F5" ; part_3="JF96/ENPsUGGJr" ; part_4="9LLyTqZ4WitEOLA" ; url=$part_1$part_2$part_3$part_4  
curl -X POST -H "Content-type:application/json" --data '{"text":"MESSAGE"}' $url

