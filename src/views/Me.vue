<template>
  <div id="me">
    <!-- 页面头部开始 -->
    <mt-header title="个人中心" id="head">
      <div slot="left" class="left">
        <img src="../assets/header/lingdang.png" alt="" />
      </div>
      <div slot="right" class="right">
        <router-link to="/set">
          <img src="../assets/header/shezhi.png" alt="" />
        </router-link>
      </div>
    </mt-header>
    <!-- 页面头部结束 -->

    <div class="me1">
      <div class="me">
        <img src="../assets/me/me.png" alt="" />
      </div>
      <div class="yonghu">
        <span
          style="color:black;font-weight:bold;text-align:center"
          slot="right"
          v-if="$store.state.isLogin == 1"
          >欢迎:{{ $store.state.userInfo.nickname }}</span
        >
        <div v-else style="margin-top:40px;font-size:18px">
          <router-link to="/login">未登录</router-link>
        </div>
      </div>
    </div>

    <div class="money">
      <ul>
        <li>
          <div>￥0.00</div>
          <span>余额</span>
        </li>
        <li>
          <div>￥0.00</div>
          <span>健康激励金</span>
        </li>
        <li>
          <div>2</div>
          <span>优惠券</span>
        </li>
        <li>
          <div>200</div>
          <span>妙币</span>
        </li>
      </ul>
    </div>

    <div class="cart">
      <ul>
        <li>
          <div>金喵&银喵会员&gt;</div>
          <span>每月0元领好礼</span>
        </li>
        <li>
          <div>全民体检一卡通&gt;</div>
          <span>送在线医生领月卡</span>
        </li>
      </ul>
    </div>

    <div class="jiankang">
      <div>健康档案</div>
      <ul>
        <li>
          <div>
            <img src="../assets/pic/pic_jiben.png" alt="" />
          </div>
          <span>基本信息</span>
        </li>
        <li>
          <div>
            <img src="../assets/pic/pic_shenghuo.png" alt="" />
          </div>
          <span>生活方式</span>
        </li>
        <li>
          <div>
            <img src="../assets/pic/pic_jiankang.png" alt="" />
          </div>
          <span>健康信息</span>
        </li>
        <li>
          <div>
            <img src="../assets/pic/pic_jiancha.png" alt="" />
          </div>
          <span>检查信息</span>
        </li>
        <li>
          <div>
            <img src="../assets/pic/pic_chazhao.png" alt="" />
          </div>
          <span>健康数据</span>
        </li>
        <li>
          <div>
            <img src="../assets/pic/pic_tijian.png" alt="" />
          </div>
          <span>体检报告</span>
        </li>
      </ul>
    </div>

    <div class="jiankang">
      <div>健康服务</div>
      <ul class="jiankang_2">
        <li>
          <div>
            <img src="../assets/pic/jihua.png" alt="" />
          </div>
          <span>我的计划</span>
        </li>
        <li>
          <div>
            <img src="../assets/pic/tijian.png" alt="" />
          </div>
          <span>我的体检</span>
        </li>
        <li>
          <div>
            <img src="../assets/pic/wenzhen.png" alt="" />
          </div>
          <span>我的问诊</span>
        </li>
        <li>
          <div>
            <img src="../assets/pic/dianhua.png" alt="" />
          </div>
          <span>电话医生</span>
        </li>
        <li>
          <div>
            <img src="../assets/pic/shipin.png" alt="" />
          </div>
          <span>视频医生</span>
        </li>
        <li>
          <div>
            <img src="../assets/pic/guahao.png" alt="" />
          </div>
          <span>我的挂号</span>
        </li>
      </ul>
    </div>
    <div>
      <mt-tabbar v-model="selectedTab" fixed>
        <mt-tab-item id="today">
          <img
            slot="icon"
            src="../assets/today2.png"
            v-if="selectedTab == 'today'"
          />
          <img src="../assets/today.png" v-else slot="icon" alt="" />
          今日计划
        </mt-tab-item>

        <mt-tab-item id="health">
          <img
            slot="icon"
            src="../assets/jk2.png"
            v-if="selectedTab == 'health'"
          />
          <img src="../assets/jk.png" alt="" slot="icon" v-else />
          健康养生
        </mt-tab-item>
        <mt-tab-item id="index">
          <img
            slot="icon"
            src="../assets/sy2.png"
            v-if="selectedTab == 'index'"
          />
          <img slot="icon" src="../assets/sy.png" v-else />
          首页
        </mt-tab-item>
        <mt-tab-item id="shopping">
          <img
            slot="icon"
            src="../assets/shopping2.png"
            v-if="selectedTab == 'shopping'"
          />
          <img src="../assets/shopping.png" v-else slot="icon" alt="" />
          商城
        </mt-tab-item>
        <mt-tab-item id="me">
          <img slot="icon" src="../assets/my2.png" v-if="selectedTab == 'me'" />
          <img src="../assets/my.png" alt="" slot="icon" v-else />
          个人中心
        </mt-tab-item>
      </mt-tabbar>
    </div>
  </div>
</template>
<style></style>
<script>
export default {
  data() {
    return {
      selectedTab: "me",
      restaurants: [],
      state1: "",
      state2: "",
    };
  },
  watch: {
    selectedTab(newVal) {
      if (newVal == "index") {
        this.$router.push("/");
      } else if (newVal == "today") {
        this.$router.push("/today");
      } else if (newVal == "shopping") {
        this.$router.push("/shopping");
      } else if (newVal == "me") {
        this.$router.push("/me");
      } else if (newVal == "health") {
        this.$router.push("/health");
      }
    },
  },
};
</script>

<style scoped>
#app {
  background-color: #f5f5f5;
}
#head {
  background-color: #f5f5f5;
  color: #202020;
}
.left > img,
.right img {
  width: 25px;
  height: 25px;
}
.me > img {
  width: 50px;
  height: 50px;
}
.me1 {
  display: flex;
}
.me {
  width: 55px;
  height: 55px;
  border: 1px solid #000;
  border-radius: 50%;
  text-align: center;
  background: linear-gradient(to top, #8d8d8d 0%, #b7b7b7 100%);
  margin: 25px;
}
.yonghu > p {
  margin: 45px auto;
  margin-left: -10px;
}
.yonghu > span {
  margin-top: 50px;
  float: left;
}
.money {
  width: 100%;
  height: 60px;
}
.money > ul {
  display: flex;
  justify-content: center;
}
.money > ul > li {
  float: left;
  width: 93px;
  text-align: center;
  padding-top: 3px;
  margin-top: 5px;
}
.money > ul > li div {
  margin-bottom: 5px;
  font-weight: bold;
  color: #272727;
}
.money > ul > li span {
  color: #2a2a2a;
}
.cart {
  width: 100%;
  height: 70px;
}
.cart > ul {
  display: flex;
  justify-content: center;
}
.cart > ul > li div,
.cart > ul > li span {
  font-size: 14px;
}
.cart > ul > li {
  float: left;
  width: 140px;
  border: 1px solid;
  text-align: center;
  background: #403d50;
  padding: 7px;
  margin-bottom: 5px;
}
.cart > ul > :first-child {
  border-top-left-radius: 9px;
  border-bottom-left-radius: 9px;
}
.cart > ul > :last-child {
  border-top-right-radius: 9px;
  border-bottom-right-radius: 9px;
}
.cart > ul > li div {
  color: #ffe9db;
}
.cart > ul > li span {
  color: #b6b5bd;
}
.jiankang {
  width: 100%;
  height: 200px;
  background-color: #ffffff;
}
.jiankang > :first-child {
  width: 100%;
  height: 40px;
  line-height: 40px;
  padding-left: 10px;
}
.jiankang > ul > li {
  float: left;
  /* border: 1px solid red; */
  width: 90px;
  text-align: center;
}
.jiankang ul {
  text-align: center;
}
.jiankang > .jiankang_2 > li > div > img {
  width: 40px;
  height: 40px;
}
</style>
