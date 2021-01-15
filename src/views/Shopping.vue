<template>
  <div class="shopping">
    <div class="input">
      <van-search placeholder="请输入搜索关键词" />
      <img src="../assets/shopping/kefu.png" alt="" />
    </div>
    <div class="lun">
      <van-swipe class="my-swipe" :autoplay="3000" indicator-color="white">
        <van-swipe-item v-for="(swiper, index) of swiper" :key="index">
          <img v-lazy="swiper.swiper_img" v-if="swiper.swiper_img != null" />
        </van-swipe-item>
      </van-swipe>
    </div>
    <div class="sort">
      <ul>
        <li v-for="(category, index) of category" :key="index">
          <img
            v-lazy="category.category_img"
            v-if="category.category_img != null"
          />
          <a href="javascript">{{ category.classify }}</a>
        </li>
        <li>
          <img src="../assets/shopping/quanbu.png" alt="" />
          <a href="javascript">全部分类</a>
        </li>
      </ul>
    </div>
    <div class="hand">
      <div>精选好物</div>
      <ul>
        <li v-for="(best, index) of best" :key="index">
          <img v-lazy="best.best_img" v-if="best.best_img != null" />
          <span>{{ best.subject }}</span
          ><br />
          <span
            >￥{{ best.b_discount }}<button>{{ best.snap_up }}</button></span
          >
        </li>
      </ul>
    </div>
    <div class="shop_ceil" v-model="seltecd">
      <ul>
        <li
          v-for="(item, index) of category"
          :key="index"
          :id="'tab' + item.id"
        >
          {{ item.classify }}
        </li>
      </ul>
    </div>
    <!-- 单一商品开始 -->
    <div class="product" v-for="(product, index) of product" :key="index">
      <ul>
        <li>
          <img v-lazy="product.img_big" v-if="product.img_big != null" />
          <div>
            <span class="span">{{ product.subject }}</span>
            <h6>{{ product.subhead }}</h6>
          </div>
          <div>
            <span class="span">惊爆价:￥{{ product.price }}</span>
            <span class="left">原价:{{ product.p_discount }}</span>
            <span class="right">本月销量:{{ product.sales }}</span>
          </div>
        </li>
      </ul>
    </div>
    <!-- 单一商品结束 -->
    <mt-tabbar v-model="selectedTab" class="mt_tabbar" fixed>
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
<script>
export default {
  data() {
    return {
      // str: [
      //   "健身减脂",
      //   "健康设备",
      //   "健康家居",
      //   "健康食物",
      //   "健康护肤",
      //   "健康体检",
      //   "健康服务",
      //   "健康套餐",
      // ],
      category: [],
      seltecd: "tab",
      product: [],
      best: [],
      swiper: [],
      page: 1,
      selectedTab: "shopping",
      totalPage: 0,
      busy: false,
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
  mounted() {
    this.axios.get("/shopping").then((res) => {
      this.category = res.data.data;
    });
    this.axios.get("/best").then((res) => {
      this.best = res.data.data;
    });
    this.axios.get("/swiper").then((res) => {
      this.swiper = res.data.data;
    });
    this.loadProduct(1, 1, (product) => {
      this.product = product;
    });
  },
  methods: {
    loadProduct(cid, page, callback) {
      this.busy = true;
      this.$indicator.open({
        text: "努力加载中...",
        spinnerType: "double-bounce",
      });
      let url = `/product?cid=${cid}&page=${page}`;
      this.axios.get(url).then((res) => {
        this.totalPage = res.data.totalPage;
        // console.log(this.totalPage);
        callback(res.data.data);
        // console.log(res);
        this.busy = false;
        this.$indicator.close();
      });
    },
  },
};
</script>
<style>
@import "../css/shopping.css";
</style>
