<template>
  <div class="register">
    <mt-header class="head" title="用户注册">
      <router-link slot="left" to="/login">
        <mt-button icon="back" style="color: #fff"></mt-button>
      </router-link>
    </mt-header>
    <div class="input">
      <mt-field
        class="input_1"
        label="用户名"
        type="text"
        v-model="username"
        :state="usernameState"
        @blur.native.capture="checkusername"
        placeholder="请输入用户名"
      >
      </mt-field>
      <mt-field
        class="input_1"
        label="昵称"
        type="text"
        v-model="nickname"
        :state="nicknameState"
        @blur.native.capture="checknickname"
        placeholder="请输入用户名"
      >
      </mt-field>
      <mt-field
        class="input_1"
        label="密码"
        type="password"
        v-model="password"
        :state="passwordState"
        @blur.native.capture="checkpassword"
        placeholder="请输入密码"
      >
      </mt-field>
      <mt-field
        class="input_1"
        label="确认密码"
        type="password"
        v-model="conpassword"
        :state="conpasswordState"
        @blur.native.capture="checkconpassword"
        placeholder="请再次输入密码"
      >
      </mt-field>
    </div>
    <div class="btn">
      <mt-button size="large" @click="handel">注册</mt-button>
    </div>
    <div class="login_1">
      <span>已有账号，<router-link to="/login">直接登录</router-link></span>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      username: "", //初始化用户名为空
      nickname: "", //初始化昵称为空
      password: "", //初始化用户名为空
      conpassword: "", //初始化确认密码为空
      usernameState: "", //为用户名输入框添加状态
      nicknameState: "", //为昵称输入框添加状态
      passwordState: "", //为密码输入框添加状态
      conpasswordState: "", //为密码输入框添加状态
    };
  },
  methods: {
    handel() {
      //会引发短路现象
      // if (
      //   this.checkusername() &&
      //   this.checkpassword() &&
      //   this.checkconpassword() &&
      //   this.checknickname()
      // )
      //现在要发送相关的用户名、密码到WEB服务器
      let params = `username=${this.username}&password=${this.password}&nickname=${this.nickname}`;
      this.axios.post("/register", params).then((res) => {
        if (res.data.code == 0) {
          this.$messagebox({
            message: "注册成功,是否跳转到?",
            title: "提示信息",
            confirmButtonText: "登录",
            cancelButtonText: "主页",
            showCancelButton: true,
          }).then((action) => {
            if (action == "confirm") {
              this.$router.push("/login");
            } else {
              this.$router.push("/shopping");
            }
          });
        } else {
          this.$toast("注册失败:" + res.data.message);
        }
      });
    },

    // 检测用户名
    checkusername() {
      let username = this.username;
      let userReg = /^[0-9a-zA-Z]{6,12}$/;
      if (userReg.test(username)) {
        this.usernameState = "success";
        return true;
      } else {
        this.$toast({
          message: "用户名格式错误",
        });
        this.usernameState = "error";
        return false;
      }
    },
    // 检测用户昵称
    checknickname() {
      let nickname = this.nickname;
      let nicknameReg = /^[0-9a-zA-Z\u4e00-\u9fa5]{6,18}$/;
      if (nicknameReg.test(nickname)) {
        this.nicknameState = "success";
        return true;
      } else {
        this.$toast({
          message: "用户昵称格式错误",
        });
        this.nicknameState = "error";
        return false;
      }
    },
    // 检测密码
    checkpassword() {
      let password = this.password;
      let passReg = /^[0-9A-Za-z\.]{6,12}$/;
      this.passwordState = "success";
      if (passReg.test(password)) {
        return true;
      } else {
        this.$toast({
          message: "密码错误",
        });
        this.passwordState = "error";
        return false;
      }
    },
    // 检测两次密码是否一致
    checkconpassword() {
      let password = this.password;
      let conpassword = this.conpassword;
      if (password == conpassword) {
        this.conpasswordState = "success";
        return true;
      } else {
        this.$messagebox("提示信息", "两次密码不一致");
        this.conpasswordState = "error";
        return false;
      }
    },
  },
};
</script>
<style scoped>
.register {
  height: 380px;
}
.head {
  background-color: #7266d4;
}
.input {
  width: 100%;
  height: 150px;
}
.input > .input_1 {
  margin-top: 10px;
  border: 1px solid #7266d4;
  border-radius: 20px;
}
.btn > :first-child {
  background-color: #7266d4;
  border-radius: 20px;
  margin-top: 50px;
  color: #fff;
}
.btn {
  position: relative;
  top: 50px;
}
.login_1 > :first-child {
  float: right;
  margin-top: 30px;
  margin-right: 10px;
  position: relative;
  top: 50px;
}
</style>
