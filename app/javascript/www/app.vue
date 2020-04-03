<template>
  <div id="app">
    <p>{{ message }}</p>
  </div>
</template>


<script lang="ts">
import { Component, Vue } from "vue-property-decorator";
@Component
export default class App extends Vue {
  message = "Hello View"
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
