<!--
 * @Author: your name
 * @Date: 2021-01-09 15:47:41
 * @LastEditTime: 2021-01-12 17:42:15
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \team\src\components\Mybottom.vue
-->
<template>
  <div class="home">
    <p>首页</p>
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
<style></style>
<script>
export default {
  data() {
    return {
      selectedTab: "index",
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
