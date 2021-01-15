<!--
 * @Author: your name
 * @Date: 2021-01-09 15:47:41
 * @LastEditTime: 2021-01-15 20:51:41
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \team\src\components\Mybottom.vue
-->
<template>
  <div class="home">
    <div class="header">
      <h1>首页</h1>
      <h6>健康多一点，生活妙无限</h6>
      <div class="header1">
        <img src="../assets/3.png" />
        <img src="../assets/2.png" />
        <img src="../assets/1.png" />
      </div>
    </div>
    <div>
      <!-- 轮播图开始 -->
      <mt-swipe
        class="swipe"
        :style="{ height: swipeHeight }"
        :auto="3000"
        :speed="200"
        :show-indicators="true"
        :continuous="true"
      >
        <mt-swipe-item v-for="(iswiper, index) of iswiper" :key="index">
          <img v-lazy="iswiper.swiper_img" v-if="iswiper.swiper_img != null" />
        </mt-swipe-item>
      </mt-swipe>
      <!-- 轮播图结束 -->
    </div>

    <!-- 精彩活动 -->
    <h3 class="cc">精彩活动</h3>
    <div class="da">
      <div class="header2">
        <img src="../assets/jifenshangcheng.jpg" />
        <img src="../assets/jisuipianyinghaoli.jpg" />
        <img src="../assets/qiandaochoujiang.jpg" />
        <img src="../assets/xueya.jpg" />
        <img src="../assets/miaobiyoumiaosha.jpg" />
        <img src="../assets/meirjiankangfan.jpg" />
      </div>
    </div>

    <!-- 首页2（资讯） -->
    <div class="zx">
      <div class="bq">健康头条</div>
      <div class="bq">健康大讲堂</div>
      <div class="bq">妙图</div>
    </div>

    <!-- 今日推荐开始头 -->
    <div class="jinrituijian">
      <mt-navbar v-model="navactive">
        <mt-tab-item
          v-for="(classify, index) of classify"
          :key="index"
          :id="'tab' + classify.cid"
          >{{ classify.cname }}
        </mt-tab-item>
      </mt-navbar>
      <mt-tab-container>
        <mt-tab-container-item>
          <div class="nr1" v-for="(details, index) of details" :key="index">
            <div class="n1">
              <div class="wz1">
                {{ details.dtitle }}
              </div>
              <p class="synopsis">{{ details.synopsis }}</p>
              <img v-lazy="details.image" v-if="details.image != null" />
              <div class="wz2">{{ details.data }}</div>
            </div>
          </div>
        </mt-tab-container-item>
      </mt-tab-container>

      <!-- 今日推荐内容 -->
      <!-- 第一个内容 -->
      <div>
        <hr class="xian" />
      </div>
    </div>
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
</template>
<style scoped>
body {
  margin: 0;
  padding: 0;
  background-color: rgb(224, 224, 224);
}
.swipe {
  width: 100%;
  background-repeat: no-repeat;
  opacity: 0.8;
}
.swipe img {
  width: 100%;
  height: 100%;
  max-width: 100%;
  max-height: 100%;
}
h6 {
  color: rgb(172, 172, 172);
}
.header1 > img {
  width: 25px;
  height: 25px;
  float: right;
  padding: 5px;
  margin-right: 10px;
}
.cc {
  margin-top: 15px;
  margin-left: 15px;
  margin-bottom: 15px;
}
.header2 > img:nth-child(1) {
  width: 150px;
  height: 160px;
  margin-left: 16px;
}
.header2 > img:nth-child(2) {
  width: 185px;
  height: 75px;
  float: right;
  margin-right: 12px;
}
.header2 > img:nth-child(3) {
  width: 185px;
  height: 75px;
  float: right;
  margin-right: 12px;
  margin-top: -75px;
}
.header2 > img:nth-child(4) {
  width: 110px;
  height: 85px;
  margin-left: 15px;
  margin-top: 6px;
}
.header2 > img:nth-child(5) {
  width: 110px;
  height: 85px;
  margin: 8px;
  margin-top: 12px;
}
.header2 > img:nth-child(6) {
  width: 110px;
  height: 85px;
  margin-right: 8px;
  margin-top: 3px;
}
.header1 {
  height: 40px;
  margin-top: -30px;
}
h6 {
  margin-left: 15px;
  font-size: 10px;
  margin-top: 20px;
}
h3 {
  margin-left: 2px;
}
.header h1 {
  font-size: 25px;
  width: 50px;
  height: 50px;
  margin-left: 10px;
  font-family: 华文新魏;
  line-height: 50px;
}
.header {
  color: rgb(19, 19, 19);
  height: 102px;
}
.home {
  height: 100%;
  background-color: rgb(255, 255, 255);
}
/* 资讯>三标签 */
.zx > :nth-child(1) {
  float: left;
}
.zx > :nth-child(2) {
  float: left;
}
.bq {
  padding: 20px;
}
/* 今日推荐 */
.jrzxt > img {
  margin-top: 20px;
  margin-bottom: 20px;
  margin-left: 20px;
  width: 90%;
}
.jinrituijian > button {
  margin: 4px;
}
.jrtj1 {
  background-color: rgb(231, 230, 230);
  border-radius: 10px;
  border: 0;
}
.jrtj2 {
  background-color: rgb(231, 230, 230);
  border-radius: 10px;
  border: 0;
}
.jrtj3 {
  background-color: rgb(231, 230, 230);
  border-radius: 10px;
  border: 0;
}
.jrtj4 {
  background-color: rgb(231, 230, 230);
  border-radius: 10px;
  border: 0;
}
/* 资讯内容 */
.xian {
  width: 340px;
  opacity: 0.3;
}
/* 首页文章详情简介 */
.wz1 {
  margin-bottom: 15px;
  margin-top: 5px;
  margin-left: 15px;
  font-weight: bold;
  font-size: 20px;
}
.synopsis {
  width: 250px;
  height: 130px;
  float: left;
  word-wrap: break-word;
  color: gray;
  margin-left: 22px;
  font-family: 楷体;
  font-weight: bold;
  text-indent: 32px;
  line-height: 18px;
}
.n1 {
  float: left;
  width: 375px;
  height: 170px;
}
.n1 img {
  width: 100px;
  height: 100px;
  float: right;
  margin: 0;
  margin-right: 2px;
  border-radius: 15px;
}
.wz2 {
  font-size: 5px;
  float: right;
  font-weight: bold;
  width: 70px;
  margin-top: 10px;
  margin-right: 5px;
}
.jinrituijian {
  float: left;
  margin-bottom: 50px;
}
</style>

<script>
export default {
  data() {
    return {
      selectedTab: "index",
      swipeHeight: "150px",
      iswiper: [],
      navactive: "tab1",
      classify: [],
      details: [],
      page: 1,
      totalPage: 0,
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
    navactive(newVal) {
      let did = newVal.replace("tab", "");
      this.page = 1;
      this.loadFoods(did, 1, (details) => {
        this.details = details;
      });
    },
  },
  mounted() {
    this.initSwipeHeight();
    // 向服务器发送请求获得图片数据
    this.axios.get("/iswiper").then((res) => {
      this.iswiper = res.data.data;
    });
    this.axios.get("/classify").then((res) => {
      this.classify = res.data.data;
    });
    this.loadFoods(1, 1, (details) => {
      this.details = details;
    });
  },
  methods: {
    // 初始化Swipe的Height属性
    initSwipeHeight() {
      //屏幕的宽
      let screenWidth = window.screen.width;
      //图片宽高
      let picwidth = 375;
      let picheight = 250;
      //轮播图的高度=图片高*屏幕宽/图片宽
      this.swipeHeight = (picheight * screenWidth) / picwidth + "px";
    },
    loadFoods(did, page, callback) {
      // this.busy = true
      let url = `/details?did=${did}&page=${page}`;
      this.axios.get(url).then((res) => {
        this.totalPage = res.data.totalPage;
        callback(res.data.data);
        // this.busy=false
        // this.$indicator
      });
    },
  },
};
</script>
