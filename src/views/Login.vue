<template>
  <div>
    <mt-header title="用户登录" class="login">
      <router-link slot="left" to="/me">
        <mt-button icon="back" style="color: #fff"></mt-button>
      </router-link>
      <router-link slot="right" to="/register">
        <mt-button style="color: #fff">注册</mt-button>
      </router-link>
    </mt-header>
    <div class="input">
      <mt-field
        label="用户名"
        type="text"
        v-model="username"
        :state="usernameState"
        @blur.native.capture="checkUsername"
        placeholder="请输入用户名"
      >
      </mt-field>
      <mt-field
        label="密码"
        text="password"
        v-model="password"
        :state="passwordState"
        @blur.native.capture="checkPassword"
        placeholder="请输入密码"
      >
      </mt-field>
    </div>
    <div class="logins">
      <mt-button size="large" @click="handle">用户登录</mt-button>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      username: "",
      password: "",
      usernameState: "",
      passwordState: "",
    };
  },
  methods: {
    handle() {
      let params = `username=${this.username}&password=${this.password}`;
      // 对象转为请求字符串
      this.axios.post("/login", params).then((res) => {
        if (res.data.code == 1) {
          this.$messagebox
            .confiram("登录失败，是否注册为新用户", "温馨提示")
            .then((action) => {
              this.$router.push("/register");
            })
            .catch((error) => {});
        }
        if (res.data.code == 0) {
          sessionStorage.setItem("userInfo", JSON.stringify(res.data.userInfo));

          this.$messagebox
            .confirm("登录成功,欢迎您的访问", "温馨提示")
            .then((action) => {
              this.$store.commit("updateUser", res.data.userInfo);

              this.$router.push("/me");
            })
            .catch((error) => {});
        }
      });
    },
    checkUsername() {
      let username = this.username;
      let usernameReg = /^[0-9a-zA-Z]{6,12}$/;
      this.usernameState = "success";
      if (usernameReg.test(usernama)) {
        return true;
      } else {
        this.$toast({
          message: "用户名不正确",
        });
        this.usernameState = "error";
        return false;
      }
    },
    checkPassword() {
      let password = this.password;
      let passwordReg = /^[0-9a-zA-Z\.]{6,12}$/;
      this.passwordState = "success";
      if (passwordReg.test(password)) {
        return true;
      } else {
        this.$toast({
          message: "密码错误",
        });
        this.passwordState = "error";
        return false;
      }
    },
  },
};
</script>
<style scoped>
.login {
  background-color: #7266d4;
}
.input > :first-child,
.input > :last-child {
  border: 1px solid #7266d4;
  margin-top: 10px;
  border-radius: 20px;
}
.logins > :first-child {
  background-color: #7266d4;
  color: #fff;
  margin-top: 30px;
  border-radius: 20px;
}
</style>
