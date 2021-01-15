<template>
  <div>
    <!-- 头部 -->
    <mt-header title="健康" class="header"></mt-header>
    <!--  -->
    <mt-navbar class="nav">
      <mt-tab-item class="tab_1"> 健康管理 </mt-tab-item>
      <mt-tab-item class="tab_2"> 健康评测 </mt-tab-item>
    </mt-navbar>
    <!-- 身体 -->
    <mt-tab-container>
      <mt-tab-container-item class="tab_item">
        <div class="fang">
          <div>健康检测</div>
          <div class="tab_title">掌上体检便捷预约</div>
          <div class="imgs">
            <img src="../assets/images/health_1.png" alt="" />
          </div>
        </div>
        <div class="fang">
          <div>关爱家人</div>
          <div class="tab_title">随时关注家人健康</div>
          <div class="imgs">
            <img src="../assets/images/health_2.jpg" alt="" />
          </div>
        </div>
        <div class="fang">
          <div>睡眠助手</div>
          <div class="tab_title">睡眠健康伴侣</div>
          <div class="imgs">
            <img src="../assets/images/health_3.jpg" alt="" />
          </div>
        </div>
        <div class="fang">
          <div>心理压力</div>
          <div class="tab_title">做你情绪的主人</div>
          <div class="imgs">
            <img src="../assets/images/health_4.jpg" alt="" />
          </div>
        </div>
        <div class="fang">
          <div>血管管理</div>
          <div class="tab_title">按时用药科学控压</div>
          <div class="imgs">
            <img src="../assets/images/health_5.jpg" alt="" />
          </div>
        </div>
        <div class="fang">
          <div>血糖管理</div>
          <div class="tab_title">关注血糖优享健康</div>
          <div class="imgs">
            <img src="../assets/images/health_6.jpg" alt="" />
          </div>
        </div>
      </mt-tab-container-item>
    </mt-tab-container>
    <div class="jian lun">
      <span>健康数据</span>
      <span>
        <router-link to="/"
          >更多<img src="../assets/images/arrow.png" alt=""
        /></router-link>
      </span>
      <mt-swipe class="swipe">
        <mt-swipe-item>
          <img class="swipe-img" src="./../assets/images/health_9.jpg" alt="" />
        </mt-swipe-item>
        <mt-swipe-item>
          <img class="swipe-img" src="./../assets/images/health_9.jpg" alt="" />
        </mt-swipe-item>
        <mt-swipe-item>
          <img class="swipe-img" src="./../assets/images/health_9.jpg" alt="" />
        </mt-swipe-item>
        <mt-swipe-item>
          <img class="swipe-img" src="./../assets/images/health_9.jpg" alt=""
        /></mt-swipe-item>
      </mt-swipe>
    </div>

    <div class="xian"></div>
    <div class="jian">
      <span>健康保障</span>
      <div><img src="./../assets/images/health_m.jpg" alt="" /></div>
    </div>
    <div class="xian"></div>
    <div class="jian">
      <span>今日饮食推见</span>
      <span>
        <router-link to="/"
          >更多<img src="../assets/images/arrow.png" alt=""
        /></router-link>
      </span>
      <mt-navbar v-model="navactive">
        <mt-tab-item
          v-for="(food, index) of food"
          :key="index"
          :id="'tab' + food.id"
          >{{ food.food_name }}
        </mt-tab-item>
      </mt-navbar>
      <mt-tab-container>
        <mt-tab-container-item>
          <div v-for="(foods, index) of foods" :key="index" class="div_img">
            <img v-lazy="foods.foods_image" v-if="foods.foods_image != null" />
            <span class="span1">{{ foods.foods_name }}</span>
            <span class="span2">{{ foods.foods_son }}.0千卡</span>
          </div>
          <p class="cozy" v-for="(foods, item) of foods" :key="item">
            {{ foods.cozy }}
          </p>
        </mt-tab-container-item>
      </mt-tab-container>
    </div>
    <div class="xian"></div>
    <div class="jian_2">
      <span>今日运动推荐</span>
      <span>
        <router-link to="/"
          >更多<img src="../assets/images/arrow.png" alt=""
        /></router-link>
      </span>
      <div><img src="../assets/images/health_11.jpg" alt="" /></div>

      <div class="tu">
        <div class="tu_1">
          <img src="../assets/images/health_12.jpg" alt="" />
        </div>
        <div class="tu_2">
          <img src="../assets/images/health_13.jpg" alt="" />
        </div>
        <div class="tu_3">
          <img src="../assets/images/health_14.jpg" alt="" />
        </div>
      </div>
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
<style scoped>
.cozy {
  float: right;
  width: 250px;
  height: 100px;
  font-size: 15px;
  font-family: 华文新魏;
  color: rgb(22, 21, 21);
}
.div_img .span1 {
  float: left;
  font-size: 12px;
  width: 80px;
  height: 20px !important;
  line-height: 20px !important;
  margin: 0 !important;
  text-align: left;
  color: black !important;
  padding-left: 3px;
}
.div_img .span2 {
  float: left;
  font-size: 12px;
  width: 80px;
  height: 20px !important;
  line-height: 20px !important;
  margin: 0 !important;
  text-align: left;
  padding-left: 3px;
  color: gray;
}
.div_img > img {
  width: 95px !important;
  height: 50px !important;
  float: left !important;
  border-radius: 0 !important;
  margin: 5px !important;
}
.div_img {
  display: table-cell;
  text-align: center;
  height: 100px;
  background: rgb(235, 229, 229);
  border: 1px solid white;
  border-radius: 5px;
  float: left;
  width: 110px;
  margin-left: 10px;
}
.header {
  width: 100%;
  height: 50px;
  background-color: #fff;
  color: #000;
  font-size: 30px;
  margin-left: -38%;
}

.nav {
  margin-top: 50px;
  width: 200px;
  margin-top: -1px;
}

.mint-navbar .mint-tab-item.is-selected {
  color: #3d3d3d;
  border-bottom: 0px solid #3d3d3d;
}
.tab_1 {
  margin-left: -29%;
  color: #3d3d3d;
}
.tab_2 {
  margin-left: -70% !important;
  color: #878787;
}
.tab_item {
  margin-top: -60px;
}
.tab_item .fang {
  width: 40%;
  height: 80px;
  background-color: #f7f7f7;
  margin-top: 80px;
  margin-left: 5%;
  border-radius: 10px;
}
.fang div:first-child {
  color: #000;
  font-size: 20px;
  font-weight: 500;
  padding-top: 10px;
  margin-left: 5px;
}
.fang .tab_title {
  color: #939393;
  font-size: 12px;
  margin-top: 10px !important;
  margin-left: 5px !important;
}
.fang .imgs img {
  width: 50px;
  height: 50px;
  border-radius: 8px;
  margin-left: 67%;
  margin-top: -55px;
}
.tab_item div:nth-child(2) {
  margin-left: 55%;
  margin-top: -21%;
}
.tab_item div:nth-child(3) {
  margin-top: 5%;
}
.tab_item div:nth-child(4) {
  margin-left: 55%;
  margin-top: -21%;
}
.tab_item div:nth-child(5) {
  margin-top: 5%;
}
.tab_item div:nth-child(6) {
  margin-left: 55%;
  margin-top: -21%;
}
.swipe {
  width: 100%;
  height: 230px;
}
.swipe .swipe-img {
  width: 180px;
  height: 200px;
  margin-left: 25%;
}

.jian {
  width: 100%;
  height: 180px;
}

.jian span:first-child {
  display: block;
  height: 50px;
  line-height: 50px;
  font-size: 18px;
  font-weight: 500;
  margin-left: 5%;
}
.jian span:nth-child(2) {
  height: 50px;
  display: block;
  line-height: 50px;
  color: #727272;
  margin-top: -48px;
  margin-left: 85%;
}
.jian span img {
  margin-top: -4px;
}
.jian div img {
  width: 340px;
  height: 100px;
  border-radius: 5px;
  margin: 0 17.5px;
  /* border: 1px solid red; */
}
.lun {
  width: 100%;
  height: 260px;
}
.jian .swipe {
  width: 100%;
  height: 200px;
}
.xian {
  width: 100%;
  height: 10px;
  background-color: #f4f5f7;
}
.jian_2 {
  width: 100%;
  height: 330px;
}
.jian_2 span:first-child {
  display: block;
  height: 50px;
  line-height: 50px;
  font-size: 18px;
  font-weight: 500;
  margin-left: 5%;
}
.jian_2 span:nth-child(2) {
  height: 50px;
  display: block;
  line-height: 50px;
  color: #727272;
  margin-top: -48px;
  margin-left: 85%;
}
.jian_2 div img {
  width: 340px;
  height: 170px;
  border-radius: 5px;
  margin: 0 17.5px;
  /* border: 1px solid red; */
}
.jian_2 .tu {
  width: 340px;
  height: 100px;
  margin-left: 5%;
  margin-top: 10px;
}
.jian_2 .tu_1 img {
  width: 100px;
  height: 100px;
  border-radius: 5px;
  float: left;
  margin-left: -3px;
}
.mint-navbar .mint-tab-item {
  padding: 6px 0 !important;
}
.jian_2 .tu_2 img {
  width: 100px;
  height: 100px;
  border-radius: 5px;
  float: left;
  margin-left: 6px;
}
.jian_2 .tu_3 img {
  width: 100px;
  height: 100px;
  border-radius: 5px;
  float: left;
  margin-left: 240px;
  margin-top: -99px;
}
</style>
<script>
import { Navbar, TabItem } from "mint-ui";
export default {
  data() {
    return {
      selectedTab: "health",
      food: [],
      foods: [],
      navactive: "tab1",
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
      let cid = newVal.replace("tab", "");
      this.page = 1;
      this.loadFoods(cid, 1, (foods) => {
        this.foods = foods;
      });
    },
  },
  mounted() {
    this.axios.get("/food").then((res) => {
      this.food = res.data.data;
    });
    this.loadFoods(1, 1, (foods) => {
      this.foods = foods;
    });
  },
  methods: {
    loadFoods(cid, page, callback) {
      // this.busy = true
      let url = `/foods?cid=${cid}&page=${page}`;
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
