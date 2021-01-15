<template>
  <div>
    <mt-header title="消息中心" class="head">
      <router-link to="/me" slot="left">
        <mt-button icon="back"></mt-button>
      </router-link>
      <div slot="right" class="right">
        <van-popover v-model="showPopover" trigger="click" :actions="actions">
          <template #reference>
            <mt-button icon="more"></mt-button>
          </template>
        </van-popover>
      </div>
    </mt-header>
    <div>
      <van-tabs v-model="active">
        <van-tab title="活动"></van-tab>
        <van-tab title="账户"></van-tab>
        <van-tab title="物流"></van-tab>
        <van-tab title="妙圈"></van-tab>
        <van-tab title="其他"></van-tab>
      </van-tabs>
    </div>
    <div class="logo">
      <img src="../assets/news/news.jpg" alt="" />
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      active: 0,
      showPopover: false,
      actions: [
        { text: "已读", icon: "add-o" },
        { text: "清除", icon: "music-o" },
      ],
    };
  },
};
</script>
<style scoped>
.head {
  background-color: #f0f0f0;
  color: #000;
}
.logo {
  margin: 100px auto;
  text-align: center;
}
.logo > img {
  width: 150px;
  height: 150px;
}
</style>
