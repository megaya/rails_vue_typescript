<template>
  <div id="app">
    <p>{{ message }}</p>
  </div>
</template>

<script lang="ts">
import { Component, Vue } from "vue-property-decorator";
@Component
export default class UserShowView extends Vue {
  message = "User View"
}
</script>

<style scoped>
</style>
