/*
 * @Author: your name
 * @Date: 2021-01-09 09:52:26
 * @LastEditTime: 2021-01-13 19:47:04
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \team\src\main.js
 */
import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";
import MintUI from "mint-ui";
import "mint-ui/lib/style.css";
import Vant from "vant";
import moment from "moment";
import qs from "qs";
import axios from "axios";
import "vant/lib/index.css";
axios.defaults.baseURL = "http://localhost:3000";
Vue.prototype.axios = axios;
Vue.prototype.qs = qs;
Vue.prototype.moment = moment;
Vue.config.productionTip = false;

Vue.use(Vant);
Vue.use(MintUI);

new Vue({
  router,
  store,
  render: (h) => h(App),
}).$mount("#app");
