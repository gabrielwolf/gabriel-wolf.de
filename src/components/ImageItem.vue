<template>
  <div id="root"><img :src="reloadSrc" /></div>
</template>

<script>
export default {
  name: "ImageItem",
  props: {
    title: String,
    src: String
  },
  computed: {
    reloadSrc: function() {
      return this.src.split(".jpg")[0] + "-preview.jpg";
    }
  }
};
</script>

<style scoped></style>
