<template>
  <div id="app">
    <p>メールアドレス</p>
    <div>
      <input type="email" placeholder="Eメール" v-model="email" autofocus="">
    </div>
    <p>password</p>
    <div>
      <input type="password" placeholder="パスワード" v-model="password" autofocus="">
    </div>
    <button @click="login()">ログイン</button>
  </div>
</template>

<script lang="ts">
import { Component, Vue } from "vue-property-decorator";
import { Authorization } from '../../api'

@Component
export default class SignInView extends Vue {
  email = ''
  password = ''

  login() {
    Authorization.signIn({ email: this.email, password: this.password }).then((result) => {
      this.$router.push('user')
    }).catch((err) => {
      console.log(err)
    });
  }
}
</script>

<style scoped>
</style>
