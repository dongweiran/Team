/*
 * @Author: your name
 * @Date: 2021-01-09 09:52:26
 * @LastEditTime: 2021-01-14 18:16:27
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \team2\src\store\index.js
 */
import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    userInfo: JSON.parse(sessionStorage.getItem("userInfo")), //保存当前登录用户
    isLogin: sessionStorage.getItem("userInfo") ? 1 : 0,
  },
  mutations: {
    updateUser(state, userInfo) {
      state.userInfo = userInfo;
      state.isLogin = 1;
    },
  },
  actions: {},
  modules: {},
});
