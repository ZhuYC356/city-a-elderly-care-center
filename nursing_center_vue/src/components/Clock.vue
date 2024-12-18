
<template>
  <h3>当前时间: {{ time }}</h3>
</template>
<script>
export default {
  name: "Clock",
  data() {
    return {
      time: new Date().toLocaleTimeString()
    }
  },
  mounted() {
    this.updateTime();
  },
  methods: {
    updateTime() {
      setInterval(() => {
        this.time = new Date().toLocaleTimeString();
      }, 1000);
    }
  },
}
</script>
<style scoped>

</style>