# yuGo
电商-Django项目(～￣▽￣)

####>*生鲜类产品 B2C PC电脑端网页
####>*功能模块：用户模块 商品模块（首页、 搜索、商品） 购物车模块 订单模块（下单、 支付）
####>*用户模块：注册、登录、激活、退出、个人中心、地址
####>*商品模块：首页、详情、列表、搜索（haystack+whoosh）
####>*购物车： 增加、删除、修改、查询
####>*订单模块：确认订单页面、提交订单（下单）、请求支付、查询支付结果、评论
####>*django默认的认证系统 AbstractUser
####>*itsdangerous 生成签名的token （序列化工具 dumps loads）
####>*邮件 （django提供邮件支持 配置参数 send_mail）
####>*缓存（缓解压力， 保存的位置、有效期、与数据库的一致性问题）
####>*搜索（ whoosh 索引 分词）
####>*购物车redis 哈希 历史记录redis list
####>*ajax 前端用ajax请求后端接口
####>*事务
####>*高并发的库存问题 （悲观锁、乐观锁）
####>*支付的使用流程
