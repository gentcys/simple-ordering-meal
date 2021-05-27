# Simple Ordering Meal

一个简单的订餐系统。

## 系统参与的主体

- 客户/用户(User): name, email, password
- 餐食(Meal): name, cover_url
- 订阅(Subscription): cut_off_at, user_id, meal_id, delivery_address
- 订单(Order): subscription_id, delivered_at

## 主体间的关系

### User, Subscription, Meal
User 发起  Subscription 时需要选择 Meal，或者选择 Meal 发起  Subscription
### Subscription 与 Meal
一个  Subscription 只能有一个 Meal
### Order 与 Subscription
新建的 Subscription 自动生成一个 Order，到了 Cut-off 的 Subscription 生成本周内的 Order

## Todo List

- [x] 新建项目
- [x] 代码部署
- [x] 用户注册
- [x] 用户登陆
- [x] 生成餐食
- [x] 用户订阅
- [x] 生成订单
- [ ] 集合订单
- [x] 餐食排行
- [x] 餐食管理
