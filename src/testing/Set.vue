<template>
  <div>
    <!-- 页面头部开始 -->
    <mt-header title="设置" class="shezhi">
      <router-link slot="left" to="/me">
        <mt-button icon="back"></mt-button>
      </router-link>
    </mt-header>
    <!-- 页面头部结束 -->
    <div class="ceil">
      <ul>
        <li>
          <a href="javascript:;">设置登录密码</a>
          <img src="../assets/total/right.png" alt="" />
        </li>
        <li>
          <a href="javascript:;">隐私设置</a>
          <img src="../assets/total/right.png" alt="" />
        </li>
        <li>
          <a href="javascript:;">用户服务协议</a>
          <img src="../assets/total/right.png" alt="" />
        </li>
        <li>
          <a href="javascript:;">隐私政策条款</a>
          <img src="../assets/total/right.png" alt="" />
        </li>
        <li>
          <a href="javascript:;">关于妙</a>
          <img src="../assets/total/right.png" alt="" />
        </li>
      </ul>
    </div>
    <div class="ceil_1">
      <ul>
        <li>
          <a href="javascript:;">消息推送</a>
          <span>已开启</span>
          <a href="javascript:;">去设置</a>
        </li>
      </ul>
    </div>
    <div class="ceil">
      <ul>
        <li>
          <a href="javascript:;">个性化推荐</a>
          <img src="../assets/total/right.png" alt="" />
        </li>
      </ul>
    </div>
    <div class="ceil_2">
      <ul>
        <li>
          <a href="javascript:;">清理缓存</a>
          <div class="ceils">
            <span>15.3MB</span>
            <img src="../assets/total/right.png" alt="" />
          </div>
        </li>
      </ul>
    </div>
    <div class="register">
      <p>
        不想继续使用妙健康了?
        <router-link to="/register"> 注册账号 </router-link>
      </p>
      <p>
        <router-link to="/">
          <mt-button type="danger" size="large" class="btn">退出</mt-button>
        </router-link>
      </p>
    </div>
  </div>
</template>
<style scoped>
.shezhi {
  background-color: #f0f0f0;
  color: #000;
}
.ceil > ul > li {
  width: 100%;
  height: 50px;
  line-height: 50px;
  margin-top: 10px;
  background-color: #f0f0f0;
}
.ceil > ul > li > :first-child {
  color: #000;
  margin-left: 10px;
}
.ceil > ul > li > :last-child {
  width: 20px;
  height: 20px;
  float: right;
  margin-top: 15px;
  margin-right: 10px;
}
.ceil_1 > ul > li {
  width: 100%;
  height: 50px;
  line-height: 50px;
  margin-top: 10px;
  background-color: #f0f0f0;
}
.ceil_1 > ul > li > :first-child {
  color: #000;
  margin-left: 10px;
  margin-right: 10px;
}
.ceil_1 > ul > li > :nth-child(2) {
  color: #ccc;
  font-size: 14px;
}
.ceil_1 > ul > li > :last-child {
  float: right;
  margin-right: 10px;
}
.ceil_2 > ul > li {
  width: 100%;
  height: 50px;
  line-height: 50px;
  margin-top: 10px;
  background-color: #f0f0f0;
}
.ceil_2 > ul > li > :first-child {
  color: #000;
  margin-left: 10px;
}
.ceils {
  float: right;
}
.ceils > :first-child {
  margin-right: 5px;
}
.ceils > :last-child {
  width: 20px;
  height: 20px;
  margin-top: -5px;
  margin-right: 10px;
}
.register {
  text-align: center;
  margin: 70px auto;
}
.register > :last-child {
  margin-top: 25px;
  font-size: 24px;
}
.register > :last-child .btn {
  border-radius: 20px;
}
</style>
